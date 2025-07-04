return {
  {
    'LudoPinelli/comment-box.nvim',
    keys = {
      { '<leader>cb', '<cmd>CBccbox<cr>', desc = 'Comment Box' },
    },
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
  },
  'JoosepAlviste/nvim-ts-context-commentstring',
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
