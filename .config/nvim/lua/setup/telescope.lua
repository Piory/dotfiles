local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
local telescope = require('telescope')
telescope.load_extension('flutter')
telescope.setup({
  defaults = {
    file_ignore_patterns = { 
      '.git',
      '.tmux',
      '.zprezto',
      'node_modules',
      'dist',
      'build',
    },
    mappings = {
      i = {
        ['<C-u>'] = false, -- Disable clearing the prompt
        ['<C-d>'] = false, -- Disable deleting half of the prompt
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

