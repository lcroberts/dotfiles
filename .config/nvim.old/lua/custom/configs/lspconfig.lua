local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local util = require("lspconfig/util")
local lspconfig = require("lspconfig")
capabilities.offsetEncoding = "utf-8"

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "sh" },
	root_dir = util.find_git_ancestor(),
})

lspconfig.pylsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
	root_dir = util.find_git_ancestor(),
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "yaml", "yaml.docker.compose" },
	root_dir = util.find_git_ancestor(),
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"clojure",
		"django-html",
		"htmldjango",
		"edge",
		"eelixir",
		"elixir",
		"ejs",
		"erb",
		"eruby",
		"gohtml",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"html-eex",
		"heex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"njk",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
	},
})

lspconfig.taplo.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "toml" },
	root_dir = util.root_pattern("*.toml", ".git"),
})

lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.signgatureHelpProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
	-- cmd = { "clangd" },
	-- filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_dir = util.root_pattern(
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git"
	),
	-- single_file_support = true,
})
