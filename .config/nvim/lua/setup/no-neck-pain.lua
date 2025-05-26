require('no-neck-pain').setup({
  width = 200,
  buffers = {
    blend = 0.3,
  },
	autocmds = {
		enableOnVimEnter = true,
		enableOnTabEnter = true,
		reloadOnColorSchemeChange = true,
	},
})
vim.keymap.set('n', '<leader>z', '<cmd>NoNeckPain<CR>')
