local style_path = vim.fn.stdpath("config") .. "/lua/custom/formats/clang-format"

local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end
local project_root = vim.fn.expand('%:h')

if (file_exists(project_root .. ".clang-format") or file_exists(project_root .. "_clang-format")) then
    if (file_exists(project_root .. ".clang_format")) then
        require("conform.formatters.clang_format").args = {
            "-assume-filename",
            "$FILENAME",
            "-style=file:" .. project_root .. ".clang-format"
        }
    else
        require("conform.formatters.clang_format").args = {
            "-assume-filename",
            "$FILENAME",
            "-style=file:" .. project_root .. "_clang-format"
        }
    end
else
    require("conform.formatters.clang_format").args = {
        "-assume-filename",
        "$FILENAME",
        "-style=file:" .. style_path,
    }
end
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will use the first available formatter in the list
		javascript = { "prettier_d", "prettier" },
		-- Formatters can also be specified with additional options
		html = { "prettier" },

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
