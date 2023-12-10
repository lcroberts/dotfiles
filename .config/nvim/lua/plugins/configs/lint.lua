require('lint').linters_by_ft = {
  markdown = { 'vale', 'cspell' },
  c = { 'cpplint', 'cspell', 'trivy' },
  python = { 'cspell', 'trivy' },
  yaml = { 'yamllinty', 'cspell' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})
