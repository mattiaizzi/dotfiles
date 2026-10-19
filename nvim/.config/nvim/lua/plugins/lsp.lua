-- Add a language: put the server in `servers` (mason/lspconfig name) and
-- optionally pass settings. Servers are installed by mason and enabled
-- automatically.
local servers = {
	ts_ls = {}, -- node / typescript / javascript
	eslint = {},
	clangd = { cmd = { "clangd", "--background-index", "--clang-tidy" } }, -- c
	ols = { -- odin: needs the core/base collections for stdlib completion
		init_options = {
			collections = (function()
				local root = vim.fn.executable("odin") == 1 and vim.fn.systemlist("odin root")[1] or nil
				if not root then
					return {}
				end
				root = root:gsub("/$", "")
				return {
					{ name = "core", path = root .. "/core" },
					{ name = "base", path = root .. "/base" },
					{ name = "vendor", path = root .. "/vendor" },
				}
			end)(),
			enable_semantic_tokens = false,
			enable_hover = true,
			enable_snippets = true,
		},
	},
	lua_ls = { settings = { Lua = { workspace = { library = { vim.env.VIMRUNTIME } } } } },
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{ "j-hui/fidget.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			for name, cfg in pairs(servers) do
				vim.lsp.config(name, cfg)
			end
			vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				automatic_enable = true,
			})
		end,
	},
}
