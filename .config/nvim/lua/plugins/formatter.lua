return {
  {
    'nvimtools/none-ls.nvim',
    event = 'BufReadPre',
    dependencies = {
      'nvim-lua/plenary.nvim', -- none-ls の依存関係
      'mason-org/mason.nvim', -- Mason と統合するために必要
      'jayp0521/mason-null-ls.nvim', -- Mason と none-ls の統合
    },
    config = function()
      require('mason-null-ls').setup({
        ensure_installed = {
          'prettier',
          'stylua',
          'sqls',
          'biome',
        },
        automatic_installation = true,
      })
    end,
  },
  {
    'stevearc/conform.nvim',
    event = {
      'BufRead',
      'BufNewFile',
    },
    config = function()
      local js_formatters = { 'prettier', 'prettierd', 'biome-check', stop_after_first = true }
      require('conform').setup({
        formatters = {
          biome_check = {
            require_cwd = true,
          },
          prettier = {
            require_cwd = true,
          },
          prettierd = {
            require_cwd = true,
          },
          gofmt = {
            require_cwd = true,
          },
          goimports_reviser = {
            require_cwd = true,
          },
          gofumpt = {
            require_cwd = true,
          },
        },

        formatters_by_ft = {
          lua = { 'stylua' },
          go = { 'gofmt', 'goimports_reviser', 'gofumpt' },
          javascript = js_formatters,
          typescript = js_formatters,
          javascriptreact = js_formatters,
          typescriptreact = js_formatters,
        },
        format_on_save = {
          timeout_ms = 1000,
          lsp_fallback = true,
        },
      })
    end,
  },
}
