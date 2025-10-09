return {
  {
    'Bekaboo/dropbar.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      vim.keymap.set('n', '<leader>m', function()
        require('dropbar.api').pick()
      end, { desc = 'Dropbar Pick' })
    end,
  },
  {
    'stevearc/oil.nvim',
    event = { 'VeryLazy' },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          return name == 'node_modules' or name == '.git'
        end,
      },
    },
    -- Optional dependencies
    dependencies = {
      {
        'echasnovski/mini.icons',
        opts = {},
      },
    },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    config = function()
      require('oil').setup()
    end,
  },
}
