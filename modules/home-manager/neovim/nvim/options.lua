vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'

vim.o.number = true
-- vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = 'a'

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("lcd %:p:h")
    end
})

-- Select venv and restart lsp
vim.api.nvim_create_user_command('Venv',
 function()
    require('swenv.api').pick_venv()
	vim.cmd('LspRestart')
 end,
 { nargs = 0 })
