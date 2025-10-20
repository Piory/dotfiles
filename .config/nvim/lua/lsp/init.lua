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
}
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = ensure_installed, -- 自動でインストールしたいlanguage server
})

vim.lsp.enable(ensure_installed)
