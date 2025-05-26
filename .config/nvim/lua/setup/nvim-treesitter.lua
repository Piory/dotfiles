require('nvim-treesitter.configs').setup({
  ensure_installed = { 
    'c', 
    'lua', 
    'vim', 
    'vimdoc', 
    'javascript', 
    'typescript', 
    'html',
    'css',
    'json',
    'dart',
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },  
})

