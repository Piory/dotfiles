local lsp = vim.lsp

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

lsp.config('typos_lsp', {
  init_options = {
    config = '~/.config/nvim/spell/.typos.toml',
  },
})

lsp.config('sqls', {
  settings = {
    sqls = {
      connections = {
        {
          driver = 'mysql',
          dataSourceName = 'root@tcp(127.0.0.1:3306)/alpha',
        },
      },
    },
  },
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
