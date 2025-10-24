vim.api.nvim_create_autocmd('LspAttach', {
  -- 中略
  callback = function()
    vim.diagnostic.config({
      virtual_lines = false,
      virtual_text = false,
    })
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '󰉥', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.INFO] = '󱩎 ',
          [vim.diagnostic.severity.HINT] = ' ',
        },
      },
    })
  end,
})

local function apply_code_actions_sync(client, bufnr, only_kinds)
  local offset_encoding = client.offset_encoding or 'utf-16'
  local win = vim.fn.bufwinid(bufnr)
  if win == -1 then
    win = 0
  end

  local params = vim.lsp.util.make_range_params(win, offset_encoding)
  if vim.api.nvim_win_get_buf(win == 0 and vim.api.nvim_get_current_win() or win) ~= bufnr then
    params.textDocument = vim.lsp.util.make_text_document_params(bufnr)
  end
  params.context = {
    only = only_kinds,
    diagnostics = {},
  }

  local result = client.request_sync('textDocument/codeAction', params, 3000, bufnr)
  if not result or not result.result then
    return
  end

  for _, action in ipairs(result.result) do
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit, offset_encoding)
    end

    if action.command then
      client.request('workspace/executeCommand', action.command, function(err)
        if err then
          vim.notify(('[lsp] workspace/executeCommand error: %s'):format(err), vim.log.levels.WARN)
        end
      end, bufnr)
    end
  end
end

local function with_fixall_guard(bufnr, fn)
  if vim.b[bufnr]._lsp_fixall_running then
    return
  end

  vim.b[bufnr]._lsp_fixall_running = true
  local ok, err = pcall(fn)
  if not ok then
    vim.notify(('[lsp] fixAll failed: %s'):format(err), vim.log.levels.WARN)
  end
  vim.defer_fn(function()
    vim.b[bufnr]._lsp_fixall_running = nil
  end, 0)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    -- When the client is Biome, add an automatic event on
    -- save that runs Biome's "source.fixAll.biome" code action.
    -- This takes care of things like JSX props sorting and
    -- removing unused imports.
    if client.name == 'biome' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup(('BiomeFixAll_%d'):format(args.buf), { clear = true }),
        buffer = args.buf,
        callback = function()
          with_fixall_guard(args.buf, function()
            apply_code_actions_sync(client, args.buf, {
              'source.fixAll.biome',
            })
          end)
        end,
      })
    elseif client.name == 'eslint' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup(('ESLintFixAll_%d'):format(args.buf), { clear = true }),
        buffer = args.buf,
        callback = function()
          with_fixall_guard(args.buf, function()
            apply_code_actions_sync(client, args.buf, {
              'source.fixAll.eslint',
            })
          end)
        end,
      })
    elseif client.name == 'dartls' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup(('DartFormat_%d'):format(args.buf), { clear = true }),
        buffer = args.buf,
        callback = function()
          with_fixall_guard(args.buf, function()
            apply_code_actions_sync(client, args.buf, {
              'source.fixAll',
            })
          end)
        end,
      })
    end
  end,
})

require('lspconfig')
-- パッケージマネージャー(mason)をセットアップする
require('mason').setup()

-- masonを介してlanguage serverを自動インストールする
local ensure_installed = {
  'typos_lsp',
  'bashls',
  'lua_ls',
  'sqls',
  'jsonls',
  'vtsls',
  'gopls',
  'protols',
  'terraformls',
  'yamlls',
  'gh_actions_ls',
  'markdown_oxide',
  'docker_language_server',
  'golangci_lint_ls',
}
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = ensure_installed, -- 自動でインストールしたいlanguage server
})

vim.lsp.enable(ensure_installed)
