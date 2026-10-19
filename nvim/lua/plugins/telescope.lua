return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader>sf", function() require("telescope.builtin").find_files() end, desc = "Files" },
		{ "<leader>sg", function() require("telescope.builtin").live_grep() end, desc = "Grep" },
		{ "<leader>sw", function() require("telescope.builtin").grep_string() end, desc = "Word" },
		{ "<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
		{ "<leader>sr", function() require("telescope.builtin").resume() end, desc = "Resume" },
		{ "<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "Help" },
		{ "<leader><leader>", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
	},
	config = function()
		require("telescope").setup({})
		pcall(require("telescope").load_extension, "fzf")
	end,
}
