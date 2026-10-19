local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>e", "<cmd>Explore<CR>", { desc = "File explorer" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics list" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local tb = require("telescope.builtin")
		local function lmap(keys, fn, desc, mode)
			map(mode or "n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
		end
		lmap("grn", vim.lsp.buf.rename, "Rename")
		lmap("gra", vim.lsp.buf.code_action, "Code action", { "n", "x" })
		lmap("grr", tb.lsp_references, "References")
		lmap("gri", tb.lsp_implementations, "Implementation")
		lmap("grd", tb.lsp_definitions, "Definition")
		lmap("grD", vim.lsp.buf.declaration, "Declaration")
		lmap("grt", tb.lsp_type_definitions, "Type definition")
		lmap("gO", tb.lsp_document_symbols, "Document symbols")
		lmap("gW", tb.lsp_dynamic_workspace_symbols, "Workspace symbols")
		lmap("<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
		end, "Toggle inlay hints")

		-- highlight references of the symbol under the cursor
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method("textDocument/documentHighlight", ev.buf) then
			local group = vim.api.nvim_create_augroup("lsp-highlight-" .. ev.buf, { clear = true })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = ev.buf, group = group, callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = ev.buf, group = group, callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})
