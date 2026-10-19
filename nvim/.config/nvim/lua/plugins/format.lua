-- Formatters are looked up on PATH or installed via mason (:MasonInstall <name>).
return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	keys = {
		{ "<leader>f", function() require("conform").format({ async = true }) end, desc = "Format buffer" },
	},
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			c = { "clang-format" },
			odin = { "odinfmt" },
			lua = { "stylua" },
		},
		format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
	},
}
