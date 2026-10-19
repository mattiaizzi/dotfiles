return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<C-n>", "<cmd>Neotree toggle reveal<CR>", desc = "File tree" },
		{ "<leader>e", "<cmd>Neotree focus reveal<CR>", desc = "Focus file tree" },
	},
	opts = {
		-- a add file (end with / for folder), d delete, r rename, c copy, m move, ? help
		filesystem = {
			filtered_items = { visible = true, hide_dotfiles = false, hide_gitignored = false },
			follow_current_file = { enabled = true },
		},
		window = { width = 35 },
	},
}
