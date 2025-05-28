return {
  'gen740/SmoothCursor.nvim',
  'akinsho/bufferline.nvim',
  'lewis6991/gitsigns.nvim',
  'Mofiqul/dracula.nvim',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'brenoprata10/nvim-highlight-colors',
  'mvllow/modes.nvim',
  'kevinhwang91/nvim-hlslens',
  'kazhala/close-buffers.nvim',
  {
    'goolord/alpha-nvim',
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    ---enables autocomplete for opts
    ---@module 'auto-session'
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },
  {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = function(_, opts)
      -- Other blankline configuration here
      return require('indent-rainbowline').make_opts(opts)
    end,
    dependencies = {
      'TheGLander/indent-rainbowline.nvim',
    },
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
  },
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
        },
        automatic_installation = true,
      })

      -- null-ls のソース設定
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier.with({
            filetypes = { 'javascriptreact' },
          }),
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
