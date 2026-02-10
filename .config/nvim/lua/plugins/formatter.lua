return {
  {
    'esmuellert/nvim-eslint',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'vue',
      'svelte',
      'astro',
    },
    cond = function()
      local buf = vim.api.nvim_get_current_buf()
      local fname = vim.api.nvim_buf_get_name(buf)
      local found = vim.fs.find({
        'eslint.config.js',
        'eslint.config.cjs',
        '.eslintrc.js',
        '.eslintrc.cjs',
        '.eslintrc.json',
        '.eslintrc.yaml',
        '.eslintrc.yml',
      }, { upward = true, path = fname })[1]
      return found ~= nil
    end,
    opts = function(_, opts)
      local opts = vim.tbl_deep_extend('force', opts or {}, {
        settings = {
          -- enable formatting
          format = true,
          -- had to force for my setup
          useFlatConfig = true,
          -- was having issues in a monorepo finding the config without this
          workingDirectory = function(bufnr)
            return {
              directory = vim.fs.root(bufnr, {
                'eslint.config.js',
                'eslint.config.cjs',
                '.eslintrc.js',
                '.eslintrc.cjs',
                '.eslintrc.json',
                '.eslintrc.yaml',
                '.eslintrc.yml',
              }),
            }
          end,
          options = {
            -- enable caching
            cache = true,
            -- enable using .ts configs
            flags = { 'unstable_ts_config' },
          },
          codeActionOnSave = {
            ['source.organizeImports'] = 'explicit',
            ['source.fixAll'] = 'explicit',
            ['source.fixAll.eslint'] = 'explicit',
          },
        },
      })
      return opts
    end,
    config = function(_, opts)
      require('nvim-eslint').setup(opts)
    end,
  },
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
        'tflint',
        'trivy',
        'eslint_d',
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
      local js_formatters = { 'prettierd', 'prettier', 'eslint_d', 'biome-check' }
      local biome_condition = function()
        local buf = vim.api.nvim_get_current_buf()
        local fname = vim.api.nvim_buf_get_name(buf)
        local found = vim.fs.find({
          'biome.json',
          'biome.jsonc',
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
        format_on_save = {
          timeout_ms = 1000,
          lsp_fallback = true,
        },
        formatters_by_ft = {
          lua = { 'stylua' },
          go = { 'gofmt', 'gofumpt' },
          javascript = js_formatters,
          typescript = js_formatters,
          javascriptreact = js_formatters,
          typescriptreact = js_formatters,
          terraform = { 'terraform_fmt', 'tflint', 'trivy' },
        },
        formatters = {
          eslint_d = {
            require_cwd = true,
            condition = function()
              local buf = vim.api.nvim_get_current_buf()
              local fname = vim.api.nvim_buf_get_name(buf)
              local found = vim.fs.find({
                'eslint.config.js',
                'eslint.config.cjs',
                '.eslintrc.js',
                '.eslintrc.cjs',
                '.eslintrc.json',
                '.eslintrc.yaml',
                '.eslintrc.yml',
              }, { upward = true, path = fname })[1]
              return found ~= nil
            end,
            args = '--stdin --fix-to-stdout --stdin-filename $FILENAME',
          },
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
          gofumpt = {
            require_cwd = true,
          },
          terraform_fmt = {
            require_cwd = true,
            command = 'terraform',
            args = { 'fmt', '-no-color', '-list=false', '$FILENAME' },
            stdin = false,
          },
          tflint = {
            require_cwd = true,
            command = 'tflint',
            args = { '--chdir', '$DIRNAME' },
            stdin = false,
          },
          trivy = {
            require_cwd = true,
            command = 'trivy',
            args = { 'fs', '$FILENAME' },
            stdin = false,
          },
        },
      }
    end,
    config = function(_, opts)
      require('conform').setup(opts)
    end,
  },
}
