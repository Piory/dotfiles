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

local function apply_code_actions_sync(client, bufnr, kind)
  local offset_encoding = client.offset_encoding or 'utf-16'
  local win = vim.fn.bufwinid(bufnr)
  if win == -1 then
    win = 0
  end

  local params = vim.lsp.util.make_range_params(win, offset_encoding)
  params.textDocument = vim.lsp.util.make_text_document_params(bufnr)
  params.context = {
    only = { kind },
    diagnostics = {},
  }

  local result = client.request_sync('textDocument/codeAction', params, 3000, bufnr)
  if not result or not result.result then
    return false
  end

  local applied = false
  for _, action in ipairs(result.result) do
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit, offset_encoding)
      applied = true
    end

    if action.command then
      local exec = client.request_sync('workspace/executeCommand', action.command, 3000, bufnr)
      if exec and exec.err then
        vim.notify(('[lsp] workspace/executeCommand error: %s'):format(exec.err), vim.log.levels.WARN)
      end
      applied = true
    end
  end

  return applied
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

local function run_fixall(client, bufnr, kinds)
  with_fixall_guard(bufnr, function()
    for _, kind in ipairs(kinds) do
      if apply_code_actions_sync(client, bufnr, kind) then
        break
      end
    end
  end)
end

local fixall_configs = {
  biome = {
    group = 'BiomeFixAll',
    kinds = {
      'source.fixAll.biome',
    },
  },
  eslint = {
    group = 'ESLintFixAll',
    kinds = {
      'source.fixAll.eslint',
    },
  },
  dartls = {
    group = 'DartFormat',
    kinds = {
      'source.fixAll',
    },
  },
}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    local config = fixall_configs[client.name]
    if config then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup(('%s_%d'):format(config.group, args.buf), { clear = true }),
        buffer = args.buf,
        callback = function()
          run_fixall(client, args.buf, config.kinds)
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
  'eslint',
}
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = ensure_installed, -- 自動でインストールしたいlanguage server
})

vim.lsp.enable(ensure_installed)
