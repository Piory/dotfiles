return {
  {
    'nvimtools/none-ls.nvim',
    event = 'BufReadPre',
    dependencies = {
      'nvim-lua/plenary.nvim', -- none-ls の依存関係
      'mason-org/mason.nvim', -- Mason と統合するために必要
      'jayp0521/mason-null-ls.nvim', -- Mason と none-ls の統合
    },
    opts = {
      ensure_installed = {
        'prettier',
        'stylua',
        'sqls',
        'biome',
      },
      automatic_installation = true,
    },
    config = function(_, opts)
      require('mason-null-ls').setup(opts)
    end,
  },
  {
    'stevearc/conform.nvim',
    event = {
      'BufRead',
      'BufNewFile',
    },
    opts = function()
      local js_formatters = { 'prettierd', 'prettier', 'biome-check', stop_after_first = true }
      local biome_condition = function()
        local buf = vim.api.nvim_get_current_buf()
        local fname = vim.api.nvim_buf_get_name(buf)
        local found = vim.fs.find({
          'biome.json',
          'biome.config.js',
          'biome.config.cjs',
        }, { upward = true, path = fname })[1]
        return found ~= nil
      end
      local prettier_condition = function()
        local buf = vim.api.nvim_get_current_buf()
        local fname = vim.api.nvim_buf_get_name(buf)
        local found = vim.fs.find({
          'prettier.config.js',
          'prettier.config.cjs',
          '.prettierrc',
          '.prettierrc.json',
          '.prettierrc.json5',
          '.prettierrc.yaml',
          '.prettierrc.yml',
          '.prettierrc.js',
          '.prettierrc.cjs',
        }, { upward = true, path = fname })[1]
        return found ~= nil
      end
      return {
        formatters = {
          prettier = {
            require_cwd = true,
            condition = prettier_condition,
          },
          prettierd = {
            require_cwd = true,
            condition = prettier_condition,
          },
          ['biome-check'] = {
            require_cwd = true,
            condition = biome_condition,
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
      }
    end,
    config = function(_, opts)
      require('conform').setup(opts)
    end,
  },
}
