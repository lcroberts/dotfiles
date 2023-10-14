local M = {}

M.general = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
		-- ["<leader>fm"] = { "<cmd> lua require('conform').format()<CR>", "Format file" },
	},
}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Toggle Breakpoint",
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Start or continue debugger",
		},
		["<leader>dus"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debugging sidebar",
		},
	},
}

M.crates = {
	plugin = true,
	n = {
		["<leader>rcu"] = {
			function()
				require("crates").upgrade_all_crates()
			end,
			"update crates",
		},
	},
}

M.jdtls = {
	plugin = true,
	n = {
		["<A-o>"] = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
		["crv"] = { "<cmd> lua require('jdtls').extract_variable() <CR>", "Extract Variable" },
		["crc"] = { "<cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
		["<leader>df"] = { "<cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
		["<leader>dn"] = { "<cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Nearest Method" },
	},
	v = {
		["crv"] = { "<cmd> lua require('jdtls').extract_variable(true) <CR>", "Extract Variable" },
		["crc"] = { "<cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
		["crm"] = { "<Esc><cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
	},
}

return M
