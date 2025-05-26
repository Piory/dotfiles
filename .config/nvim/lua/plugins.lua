return require('lazy').setup({
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'nvim-lua/lsp-status.nvim',
  'nvim-treesitter/nvim-treesitter',
  'onsails/lspkind.nvim',
  'gen740/SmoothCursor.nvim',
  'akinsho/bufferline.nvim',
  'lewis6991/gitsigns.nvim',
  'Mofiqul/dracula.nvim',
  'karb94/neoscroll.nvim',
  'windwp/nvim-autopairs',
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "github/copilot.vim",
    lazy=false,
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = true,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },
  {
    'shellRaining/hlchunk.nvim',
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
     -- 補完エンジン nvim-cmp の設定
     "hrsh7th/nvim-cmp",
     event = "InsertEnter", -- 挿入モードに入ったときにプラグインをロード
     dependencies = { -- nvim-cmp に必要な依存プラグイン
       { "hrsh7th/cmp-buffer" }, -- 現在のバッファの内容を補完候補に含める
       { "saadparwaiz1/cmp_luasnip" }, -- LuaSnip と nvim-cmp を統合
       { "L3MON4D3/LuaSnip" }, -- スニペットエンジン LuaSnip
       { "rafamadriz/friendly-snippets" }, -- 事前定義されたスニペットコレクション
     },
  },
})
