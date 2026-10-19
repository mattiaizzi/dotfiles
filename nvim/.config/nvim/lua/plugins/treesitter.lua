return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = { "lua", "vim", "vimdoc", "c", "odin", "javascript", "typescript", "json", "markdown" },
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
