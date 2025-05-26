require('lspsaga').setup({
  finder = {
    max_height = 0.6,
    default = 'tyd+ref+imp+def',
    keys = {
      toggle_or_open = '<CR>',
      vsplit = 'v',
      split = 's',
      tabnew = 't',
      tab = 'T',
      quit = 'q',
      close = '<Esc>',
    },
    methods = {
      tyd = 'textDocument/typeDefinition',
    },
  },
})
keymap.set('n', '<leader>,',  "<Cmd>Lspsaga finder<CR>",  { desc = 'Telescope: live grep args', })

