return {
  {
    'LudoPinelli/comment-box.nvim',
    keys = {
      { '<leader>cb', '<cmd>CBccbox<cr>', desc = 'Comment Box' },
    },
  },
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup({
        enable_autocmd = false,
      })
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
