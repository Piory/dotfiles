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
