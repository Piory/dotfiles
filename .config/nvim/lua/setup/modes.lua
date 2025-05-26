require('modes').setup({
	colors = {
		bg = "", -- Optional bg param, defaults to Normal hl group
		copy = '#FFEE55',
		delete = "#c75c6a",
		insert = '#55AAEE',
		visual = '#009944',
	},

	-- Set opacity for cursorline and number background
	line_opacity = 0.4,

	-- Enable cursor highlights
	set_cursor = true,

	-- Enable cursorline initially, and disable cursorline for inactive windows
	-- or ignored filetypes
	set_cursorline = true,

	-- Enable line number highlights to match cursorline
	set_number = true,

	-- Enable sign column highlights to match cursorline
	set_signcolumn = true,

	-- Disable modes highlights in specified filetypes
	-- Please PR commonly ignored filetypes
	ignore_filetypes = { 'NvimTree', 'TelescopePrompt' }
})
