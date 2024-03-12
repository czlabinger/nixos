vim.keymap.set({'n'}, '<leader>e', ':NERDTreeToggle<CR>', { silent=true, desc='Toggle NerdTree' })
vim.keymap.set({'n'}, '<C-l>', '<C-W>l<CR>', { silent=true, desc='Window left' })
vim.keymap.set({'n'}, '<C-h>', '<C-W>h<CR>', { silent=true, desc='Window right' })
vim.keymap.set({'n'}, '<leader>t', ':FloatermToggle<CR>', { silent=true, desc="Toggle floating terminal" })
vim.keymap.set({'n'}, '<leader>g', ':Neogit<CR>', { silent=true, desc="Open git log" })
vim.keymap.set({'n'}, '<leader>gc', ':Neogit commit<CR>', { silent=true, desc="Open git commit window" })

