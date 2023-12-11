require('lint').linters_by_ft = {
  markdown = { 'vale', 'cspell' },
  c = { 'cpplint', 'cspell' },
  python = { 'cspell' },
  yaml = { 'yamllint', 'cspell' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})
