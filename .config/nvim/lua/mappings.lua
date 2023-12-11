-- Lsp keymaps are in lspconfig
-- document existing key chains
local wk = require 'which-key'
wk.register {
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]ebug and [D]iagnostics', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it and [G]oto', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename and [R]ust', _ = 'which_key_ignore' },
  -- ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>f'] = { name = '[F]ind and [F]ormat', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
  ['<leader>b'] = { name = '[B]lock', _ = 'which_key_ignore' },
}
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
wk.register({
  ['<leader>'] = { name = 'VISUAL <leader>' },
  ['<leader>h'] = { 'Git [H]unk' },
}, { mode = 'v' })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Nvim Tree
vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle<cr>', { desc = 'Toggle filetree' })
vim.keymap.set('n', '<leader>e', '<cmd> NvimTreeFocus<cr>', { desc = 'Focus filetree' })

-- Undo Tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle undo tree' })

-- Buffer tabthrough
vim.keymap.set('n', '<Tab>', '<cmd> bnext<cr>', { desc = 'Move to next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd> bprevious<cr>', { desc = 'Move to previous buffer' })
-- Buffer close
vim.keymap.set('n', '<leader>x', '<cmd> bdelete<cr>', { desc = 'Close current buffer' })

-- Save for Ctrl+s
vim.keymap.set('n', '<C-s>', '<cmd> w<cr>', { desc = 'Save file' })
-- Copy file
vim.keymap.set('n', '<C-c>', '<cmd> %y+<cr>', { desc = 'Copy file contents' })

-- Vim Tmux navigation
vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'window left' })
vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'window right' })
vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'window down' })
vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'window up' })
vim.keymap.set('t', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'window left' })
vim.keymap.set('t', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'window right' })
vim.keymap.set('t', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'window down' })
vim.keymap.set('t', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'window up' })

-- Navigate in insert mode
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move left' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move right' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Move up' })
-- Navigate to beginning and end of lines
vim.keymap.set('i', '<C-b>', '<Esc>_i', { desc = 'Beginning of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'Beginning of line' })

-- Clear highlights
vim.keymap.set('n', '<Esc>', '<cmd> noh<cr>', { desc = 'Clear highlights' })

-- Telsecope keybinds
-- See `:help telescope.builtin`
local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = '[f]ind [r]ecently opened files' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[f]ind existing [b]uffers' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[f]ind [f]iles' })
vim.keymap.set('n', '<leader>ft', telescope_live_grep_open_files, { desc = '[f]ind [t]ext' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[f]ind [h]elp page' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[f]ind current [w]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[f]ind by [g]rep' })
vim.keymap.set('n', '<leader>fG', ':LiveGrepGitRoot<cr>', { desc = '[f]ind by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[f]ind [d]iagnostics' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[f]ind [r]esume' })
vim.keymap.set('n', '<leader>f/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[f]uzzily search [/] in current buffer' })
-- vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })

-- Vim Fugitive (Git)
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Open git' })

-- Comment.nvim
vim.keymap.set('n', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = 'Toggle line comment' })
vim.keymap.set('n', '<leader>b/', "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>", { desc = 'Toggle block comment' })
vim.keymap.set('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = 'Toggle line comment' })
vim.keymap.set('v', '<leader>b/', "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>", { desc = 'Toggle block comment' })

-- Nvterm
vim.keymap.set('n', '<A-h>', '<cmd>lua require("nvterm.terminal").toggle "horizontal"<cr>', { desc = 'Toggle horizontal terminal' })
vim.keymap.set('t', '<A-h>', '<cmd>lua require("nvterm.terminal").toggle "horizontal"<cr>', { desc = 'Toggle horizontal terminal' })
vim.keymap.set('n', '<A-v>', '<cmd>lua require("nvterm.terminal").toggle "vertical"<cr>', { desc = 'Toggle vertical terminal' })
vim.keymap.set('t', '<A-v>', '<cmd>lua require("nvterm.terminal").toggle "vertical"<cr>', { desc = 'Toggle vertical terminal' })
vim.keymap.set('n', '<A-i>', '<cmd>lua require("nvterm.terminal").toggle "float"<cr>', { desc = 'Toggle floating terminal' })
vim.keymap.set('t', '<A-i>', '<cmd>lua require("nvterm.terminal").toggle "float"<cr>', { desc = 'Toggle floating terminal' })

-- Diagnostic
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- DAP
vim.keymap.set('n', '<leader>db', '<cmd> DapToggleBreakpoint <CR>', { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>dc', '<cmd> DapContinue <CR>', { desc = 'DAP continue' })
vim.keymap.set('n', '<leader>dsu', function()
  local widgets = require 'dap.ui.widgets'
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = 'Open debug sidebar' })

-- Rust crates
vim.keymap.set('n', '<leader>rcu', function()
  require('crates').upgrade_all_crates()
end, { desc = 'Upgrade crates' })

-- UFO
vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })

-- Harpoon
local harpoon = require 'harpoon'
vim.keymap.set('n', '<leader>ha', function()
  harpoon:list():append()
end, { desc = 'Harpoon append' })
vim.keymap.set('n', '<leader>hl', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Harpoon list' })

vim.keymap.set('n', '<leader>1', function()
  harpoon:list():select(1)
end, { desc = 'Navigate to first harpoon file' })
vim.keymap.set('n', '<leader>2', function()
  harpoon:list():select(2)
end, { desc = 'Navigate to second harpoon file' })
vim.keymap.set('n', '<leader>3', function()
  harpoon:list():select(3)
end, { desc = 'Navigate to third harpoon file' })
vim.keymap.set('n', '<leader>4', function()
  harpoon:list():select(4)
end, { desc = 'Navigate to fourth harpoon file' })

-- Glow previewer
vim.keymap.set('n', '<leader>tg', vim.cmd.Glow, { desc = 'Toggle glow md preview' })
