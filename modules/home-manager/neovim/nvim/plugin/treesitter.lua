require('nvim-treesitter.configs').setup {
    ensure_installed = {
		java
	},

    auto_install = true,

    highlight = { enable = true },

    indent = { enable = true },
}
