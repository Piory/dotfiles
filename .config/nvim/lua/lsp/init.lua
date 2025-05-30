vim.api.nvim_create_autocmd('LspAttach', {
  -- 中略
  callback = function()
    vim.diagnostic.config({
      virtual_lines = false,
      virtual_text = false,
    })
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
-- パッケージマネージャー(mason)をセットアップする
require('mason').setup()

-- masonを介してlanguage serverを自動インストールする
local ensure_installed = {
  'typos_lsp',
  'lua_ls',
  'sqls',
  'jsonls',
  'ts_ls',
  'gopls',
}
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = ensure_installed, -- 自動でインストールしたいlanguage server
})

vim.lsp.enable(ensure_installed)
