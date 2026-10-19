return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	opts = {
		keymap = { preset = "default" }, -- <C-y> accept, <C-space> open, <C-n>/<C-p> select
		sources = { default = { "lsp", "path", "buffer" } },
	},
}
