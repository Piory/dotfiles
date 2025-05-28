local lsp = vim.lsp

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- フォーマット
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 3000 })
        end,
      })
    end
  end,
})

-- パッケージマネージャー(mason)をセットアップする
require('mason').setup()

-- masonを介してlanguage serverを自動インストールする
local ensure_installed = {
  'lua_ls',
  'sqls',
  'ts_ls',
  'gopls',
}
require('mason-lspconfig').setup {
  automatic_installation = true,
  ensure_installed = ensure_installed, -- 自動でインストールしたいlanguage server
}

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
  })
})

lsp.config('lua_ls', {
  -- nvim-lspconfig が設定したコンフィグにsettingsを追加する
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    }
  },
})
lsp.enable(ensure_installed)
