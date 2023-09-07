local style_path = vim.fn.stdpath("config") .. "/lua/custom/formats/clang-format"
require("conform.formatters.clang_format").args = {
	"-assume-filename",
	"$FILENAME",
	-- "-style={BasedOnStyle: LLVM, IndentWidth: 4}",
	"-style=file:" .. style_path,
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
