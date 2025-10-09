require('lazy').setup({
  defaults = {
    lazy = true,
  },
  spec = {
    { import = 'plugins/colorscheme' },
    { import = 'plugins/ai' },
    { import = 'plugins/comment' },
    { import = 'plugins/db-client' },
    { import = 'plugins/file-explorer' },
    { import = 'plugins/flash' },
    { import = 'plugins/formatter' },
    { import = 'plugins/lsp' },
    { import = 'plugins/test' },
    { import = 'plugins/telescope' },
    { import = 'plugins/plugins' },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
