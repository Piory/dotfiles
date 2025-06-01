return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',       -- none-ls の依存関係
      'mason-org/mason.nvim',        -- Mason と統合するために必要
      'jayp0521/mason-null-ls.nvim', -- Mason と none-ls の統合
    },
    config = function()
      local null_ls = require('null-ls')
      require('mason-null-ls').setup({
        ensure_installed = {
          'prettier',
          'stylua',
          'sqls'
        },
        automatic_installation = true,
      })

      -- null-ls のソース設定
      null_ls.setup({
        sources = {
          -- go
          null_ls.builtins.formatting.gofmt.with({
            filetypes = { 'go' }, -- Go ファイルに適用
          }),
          null_ls.builtins.formatting.goimports_reviser.with({
            filetypes = { 'go' }, -- Go ファイルに適用
          }),
          null_ls.builtins.formatting.golines.with({
            filetypes = { 'go' }, -- Go ファイルに適用
          }),
          null_ls.builtins.formatting.gofumpt.with({
            filetypes = { 'go' }, -- Go ファイルに適用
          }),
          -- JavaScript/TypeScript
          null_ls.builtins.formatting.prettier.with({
            filetypes = { 'javascriptreact' }, -- React JavaScript ファイルに適用
          }),
          -- Lua
          null_ls.builtins.formatting.stylua.with({
            filetypes = { 'lua' }, -- Lua ファイルに適用
          }),
        },
      })

      -- 保存時に自動フォーマット
      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function(args)
          vim.lsp.buf.format({
            bufnr = args.buf,
            timeout_ms = 3000,
          })
        end,
      })
    end,
  },
}
