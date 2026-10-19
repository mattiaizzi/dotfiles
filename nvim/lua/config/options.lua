local o = vim.o

o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true
o.scrolloff = 10
o.termguicolors = true

o.mouse = "a"
o.showmode = false
o.confirm = true
o.undofile = true
o.updatetime = 250
o.timeoutlen = 1000

o.ignorecase = true
o.smartcase = true
o.inccommand = "split"

o.splitright = true
o.splitbelow = true

-- indentation (override per filetype in after/ftplugin/<ft>.lua)
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.breakindent = true

vim.schedule(function()
	o.clipboard = "unnamedplus"
end)

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})
