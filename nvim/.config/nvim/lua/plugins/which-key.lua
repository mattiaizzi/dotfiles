return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 0,
		spec = {
			{ "<leader>s", group = "Search" },
			{ "<leader>t", group = "Toggle" },
		},
	},
}
