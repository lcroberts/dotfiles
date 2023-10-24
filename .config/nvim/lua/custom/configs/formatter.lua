local M = {
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	command = "FormatWriteLock",
})

return M
