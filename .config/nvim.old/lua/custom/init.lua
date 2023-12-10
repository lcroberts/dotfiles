vim.opt.colorcolumn = "80"
vim.g.dap_virtual_text = true
vim.opt.relativenumber = true
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = -1 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.o.smarttab = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "css" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})
