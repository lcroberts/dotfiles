local cmp = require("cmp")

local plugins = {
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"rust-analyzer",
				"bash-language-server",
				"python-lsp-server",
				"yaml-language-server",
				"yamllint",
				"cfn-lint",
				"lua-language-server",
				"prettier",
				"stylua",
				"jdtls",
				"java-debug-adapter",
				"java-test",
				"taplo",
				"clangd",
				"clang-format",
				"codelldb",
			},
		},
	},
	{
		"nvim-treesitter",
		opts = {
			ensure_installed = {
				"c",
				"python",
				"bash",
				"regex",
			},
		},
	},
	-- {
	--   "jose-elias-alvarez/null-ls.nvim",
	--   event = "VeryLazy",
	--   opts = function ()
	--     return require "custom.configs.null-ls"
	--   end,
	-- },
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = function()
			return require("custom.configs.conform")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local M = require("plugins.configs.cmp")
			M.completion.completeopt = "menu,menuone,noselect"
			M.mapping["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = false,
			})
			table.insert(M.sources, { name = "crates" })
			return M
		end,
	},
	{
		"mfussenegger/nvim-dap",
		-- Needs lldb package
		init = function()
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = false,
		config = function(_, opts)
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
		event = "VeryLazy",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"tpope/vim-surround",
		lazy = false,
	},
	{
		"tpope/vim-fugitive",
		lazy = false,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			return require("custom.configs.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
			crates.show()
			require("core.utils").load_mappings("crates")
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = { "java" },
		init = function()
			require("core.utils").load_mappings("jdtls")
		end,
	},
}
return plugins
