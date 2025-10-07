return {
  {
    'Bekaboo/dropbar.nvim',
    keys = {
      {
        '<leader>m',
        function()
          require('dropbar.api').pick()
        end,
        desc = 'Dropbar Pick',
      },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeFocus' },
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree' },
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'stevearc/oil.nvim',
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
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
}
