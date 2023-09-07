require("conform.formatters.yamlfix").args = {
	"-assume-filename",
	"$FILENAME",
	'-style="{BasedOn: llvm, IndentWidth: 4}"',
	-- arg = { "-assume-filename", "$FILENAME", '-style="{BasedOn: llvm, IndentWidth: 4}"' },
}
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will use the first available formatter in the list
		javascript = { "prettier_d", "prettier" },
		-- Formatters can also be specified with additional options
		python = {
			formatters = { "isort", "black" },
			-- Run formatters one after another instead of stopping at the first success
			run_all_formatters = true,
		},

		c = {
			formatters = { "clang_format" },
		},
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ buf = args.buf })
	end,
})
