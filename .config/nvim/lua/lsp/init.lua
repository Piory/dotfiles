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
        group = vim.api.nvim_create_augroup('BiomeFixAll', { clear = true }),
        callback = function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                'source.fixAll.biome',
              },
              diagnostics = {},
            },
            apply = true,
          })
        end,
      })
    elseif client.name == 'eslint' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('ESLintFixAll', { clear = true }),
        callback = function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                'source.organizeImports',
                'source.fixAll',
                'source.fixAll.eslint',
              },
              diagnostics = {},
            },
            apply = true,
          })
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
