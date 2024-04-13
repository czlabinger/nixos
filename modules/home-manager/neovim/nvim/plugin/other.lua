-- Colorscheme
vim.cmd("colorscheme gruvbox")

-- Comment
require("Comment").setup()

-- venv
require("swenv").setup({
	post_set_venv = function()
		vim.cmd('LspRestart')
	end,
})
