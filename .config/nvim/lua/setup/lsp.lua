local lsp = vim.lsp

-- パッケージマネージャー(mason)をセットアップする
require('mason').setup()

-- masonを介してlanguage serverを自動インストールする
local ensure_installed = {
  'lua_ls',
  'sqls',
  'ts_ls',
  'gopls',
}
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = ensure_installed, -- 自動でインストールしたいlanguage server
})

-- language serverの設定をする
lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities({
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  }),
})

lsp.config('lua_ls', {
  -- nvim-lspconfig が設定したコンフィグにsettingsを追加する
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})
lsp.enable(ensure_installed)
