return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'prochri/telescope-all-recent.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'kkharji/sqlite.lua',
      -- optional, if using telescope for vim.ui.select
      'stevearc/dressing.nvim',
    },
    opts = {
      -- your config goes here
    },
  },
}
