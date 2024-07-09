local vim = vim

return {
  -- Theme
  {
    'lcroberts/persistent-colorscheme.nvim',
    -- dir = '~/Projects/Plugins/persistent-colorscheme.nvim',
    lazy = false,
    priority = 1000,
    dependencies = {
      'RRethy/nvim-base16', -- Lots of baked-in themes and support to add more
      {
        'catppuccin/nvim',
        name = 'catppuccin',
      },
    },
    opts = {
      colorscheme = 'tokyonight',
      transparent = true,
      transparency_options = {
        additional_groups = {},
        excluded_groups = {},
        transparent_prefixes = {},
        always_transparent = {
          'Folded',
        },
      },
    },
  },

  { 'nvim-tree/nvim-web-devicons', enabled = true },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {},
  },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = function()
      -- IDK why I have to do the text like this but it works
      local logo = [[
 ██████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗     ████████╗██╗███╗   ███╗███████╗██╗
██╔════╝██╔═══██╗██╔══██╗██║████╗  ██║██╔════╝     ╚══██╔══╝██║████╗ ████║██╔════╝██║
██║     ██║   ██║██║  ██║██║██╔██╗ ██║██║  ███╗       ██║   ██║██╔████╔██║█████╗  ██║
██║     ██║   ██║██║  ██║██║██║╚██╗██║██║   ██║       ██║   ██║██║╚██╔╝██║██╔══╝  ╚═╝
╚██████╗╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝       ██║   ██║██║ ╚═╝ ██║███████╗██╗
 ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝        ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝╚═╝
        ]]
      logo = string.rep('\n', 4) .. logo .. '\n\n'
      local opts = {
        theme = 'doom',
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, '\n'),
          center = {
            { action = 'Telescope find_files', desc = ' Find file', icon = ' ', key = 'f' },
            { action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'n' },
            { action = 'Telescope oldfiles', desc = ' Recent files', icon = ' ', key = 'r' },
            { action = 'Telescope live_grep', desc = ' Find text', icon = ' ', key = 'g' },
            { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
            { action = 'EnterConfig', desc = ' Config', icon = ' ', key = 'c' },
            { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
          },
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
        button.key_format = '  %s'
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          pattern = 'DashboardLoaded',
          callback = function()
            require('lazy').show()
          end,
        })
      end

      return opts
    end,
  },

  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ebug and [D]iagnostics', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it and [G]oto', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = '[H]arpoon and Git [H]unk', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename and [R]ust', _ = 'which_key_ignore' },
        ['<leader>f'] = { name = '[F]ind and [F]ormat', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle and [T]rouble', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>b'] = { name = '[B]lock', _ = 'which_key_ignore' },
      }

      -- register which-key VISUAL mode
      -- required for visual <leader>hs (hunk stage) to work
      require('which-key').register({
        ['<leader>'] = { name = 'VISUAL <leader>' },
        ['<leader>b'] = { name = '[B]lock', _ = 'which_key_ignore' },
        ['<leader>h'] = { 'Git [H]unk' },
      }, { mode = 'v' })
      require('which-key').setup {}
    end,
  },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '󰍵' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '│' },
      }, -- See `:help gitsigns.txt`
      on_attach = function(bufnr)
        -- vim.keymap.set({ 'n' }, ']c', function()
        --   if vim.wo.diff then
        --     return ']c'
        --   end
        --   vim.schedule(function()
        --     package.loaded.gitsigns.next_hunk()
        --   end)
        --   return '<Ignore>'
        -- end, { desc = 'Jump to next hunk' })
        -- vim.keymap.set({ 'n' }, '[c', function()
        --   if vim.wo.diff then
        --     return ']c'
        --   end
        --   vim.schedule(function()
        --     package.loaded.gitsigns.prev_hunk()
        --   end)
        --   return '<Ignore>'
        -- end, { desc = 'Jump to prev hunk' })

        vim.keymap.set({ 'n' }, '<leader>hs', package.loaded.gitsigns.stage_hunk, { desc = 'git stage hunk' })
        vim.keymap.set({ 'n' }, '<leader>hr', package.loaded.gitsigns.reset_hunk, { desc = 'git reset hunk' })
        vim.keymap.set({ 'n' }, '<leader>hS', package.loaded.gitsigns.stage_buffer, { desc = 'git Stage buffer' })
        vim.keymap.set({ 'n' }, '<leader>hu', package.loaded.gitsigns.undo_stage_hunk, { desc = 'undo stage hunk' })
        vim.keymap.set({ 'n' }, '<leader>hR', package.loaded.gitsigns.reset_buffer, { desc = 'git Reset buffer' })
        vim.keymap.set({ 'n' }, '<leader>hp', package.loaded.gitsigns.preview_hunk, { desc = 'preview git hunk' })
        vim.keymap.set({ 'n' }, '<leader>hd', package.loaded.gitsigns.diffthis, { desc = 'git diff against index' })

        vim.keymap.set({ 'n' }, '<leader>hb', function()
          package.loaded.gitsigns.blame_line { full = false }
        end, { desc = 'git blame line' })

        vim.keymap.set({ 'n' }, '<leader>hD', function()
          package.loaded.gitsigns.diffthis '~'
        end, { desc = 'git diff against last commit' })

        vim.keymap.set({ 'n' }, '<leader>tb', package.loaded.gitsigns.toggle_current_line_blame, { desc = 'toggle git blame line' })
        vim.keymap.set({ 'n' }, '<leader>td', package.loaded.gitsigns.toggle_deleted, { desc = 'toggle git show deleted' })
        vim.keymap.set({ 'n' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            package.loaded.gitsigns.next_hunk()
          end)
          return '<Ignore>'
        end, { desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n' }, '<leader>hs', function()
          package.loaded.gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })

        vim.keymap.set({ 'n' }, '<leader>hr', function()
          package.loaded.gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
      end,
    },
    dependencies = {
      'lcroberts/persistent-colorscheme.nvim',
    },
    config = function(_, opts)
      require('gitsigns').setup(opts)
      require('persistent-colorscheme').make_prefix_transparent 'GitGutter'
    end,
  },

  {
    'NvChad/nvim-colorizer.lua',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'folke/zen-mode.nvim',
    event = 'VeryLazy',
    opts = {
      window = {},
    },
  },
}
