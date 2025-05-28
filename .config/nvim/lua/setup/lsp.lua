-- -- hover を表示したらドキュメントを表示
-- vim.api.nvim_set_option('updatetime', 1000)
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     -- ここに `textDocument/hover` で表示させたくないファイルタイプを指定する
--     if args.filetype == 'NvimTree' or args.filetype == 'NeogitCommitMessage' then
--       return
--     end
--     vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
--     vim.cmd [[autocmd CursorHold,CursorHoldI * silent lua vim.lsp.buf.hover()]]
--   end,
-- })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    client.server_capabilities.semanticTokensProvider = nil
    client.server_capabilities.documentHighlightProvider = false
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
vim.lsp.config('*', {
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

vim.lsp.config('lua_ls', {
  -- nvim-lspconfig が設定したコンフィグにsettingsを追加する
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    }
  },
})
vim.lsp.enable(ensure_installed)
