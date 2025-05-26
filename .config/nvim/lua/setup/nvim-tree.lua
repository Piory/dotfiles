vim.g.nvim_tree_respect_buf_cwd = 1

require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})

-- start neovim with open nvim-tree
require("nvim-tree.api").tree.toggle(true, false)
