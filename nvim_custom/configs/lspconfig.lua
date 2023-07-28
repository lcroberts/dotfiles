local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local util = require "lspconfig/util"
local lspconfig = require "lspconfig"

lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "sh" },
  root_dir = util.find_git_ancestor()
})

lspconfig.pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  root_dir = util.find_git_ancestor()
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yaml", "yaml.docker.compose" },
  root_dir = util.find_git_ancestor()
})

-- lspconfig.jdtls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "java" },
--  })

-- lspconfig.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"rust"},
--   root_dir = util.root_pattern("Cargo.toml"),
--   settings = {
--     ['rust_analyzer'] = {
--       cargo = {
--         allFeatures = true,
--       },
--     },
--   },
-- })
