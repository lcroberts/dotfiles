local vim = vim

return {
  -- Plugin causes lag issues in zig files
  {
    'HiPhish/rainbow-delimiters.nvim',
    event = 'VeryLazy',
    config = function()
      vim.g.rainbow_delimiters = {
        blacklist = { 'zig' },
      }
    end,
  },

  'mg979/vim-visual-multi',
  'tpope/vim-eunuch',
  'tpope/vim-repeat',

  {
    'tpope/vim-rhubarb',
    dependencies = {
      {
        'tpope/vim-fugitive',
        config = function()
          vim.keymap.set({ 'n' }, '<leader>gs', vim.cmd.Git, { desc = 'Open git' })
        end,
      },
    },
  },

  {
    'mbbill/undotree',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set({ 'n' }, '<leader>ut', vim.cmd.UndotreeToggle, { desc = 'Undotree Toggle' })
    end,
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      exclude = {
        filetypes = {
          'dashboard',
        },
      },
    },
  },

  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {
      mappings = {
        basic = false,
        extra = false,
      },
    },
    config = function(_, opts)
      require('Comment').setup(opts)
      vim.keymap.set({ 'n' }, '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = 'Toggle line comment' })
      vim.keymap.set({ 'n' }, '<leader>b/', "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>", { desc = 'Toggle block comment' })
      vim.keymap.set({ 'v' }, '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = 'Toggle line comment' })
      vim.keymap.set({ 'v' }, '<leader>b/', "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>", { desc = 'Toggle block comment' })
    end,
  },

  {
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    version = false,
    config = function()
      require('mini.pairs').setup {
        modes = { insert = true, command = false, terminal = false },
      }

      require('mini.surround').setup()
      require('mini.ai').setup()

      require('mini.indentscope').setup {
        symbol = '│',
        options = { try_as_border = true },
      }
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'dashboard',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'trouble',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  {
    'RRethy/vim-illuminate',
    event = 'VeryLazy',
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
    },
    config = function(_, opts)
      require('illuminate').configure(opts)

      vim.keymap.set({ 'n' }, ']]', function()
        require('illuminate').goto_next_reference(true)
      end, { desc = 'Next reference' })
      vim.keymap.set({ 'n' }, '[[', function()
        require('illuminate').goto_prev_reference(true)
      end, { desc = 'Previous reference' })
    end,
  },

  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    opts = {
      signs = true,
    },
    config = function(_, opts)
      require('todo-comments').setup(opts)
      vim.keymap.set({ 'n' }, '<leader>ct', '<cmd>TodoQuickFix<cr>', { desc = 'Todo Quick Fix' })
    end,
  },

  {
    'Wansmer/treesj',
    event = 'VeryLazy',
    keys = {
      { 'g,', '<cmd>TSJToggle <cr>', desc = 'Toggle line split' },
    },
    -- dependencies = { name = 'nvim-treesiter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
      local lang_utils = require 'treesj.langs.utils'

      local langs = {
        zig = {
          InitList = lang_utils.set_preset_for_dict(),
          FnCallArguments = lang_utils.set_preset_for_args(),
          ParamDeclList = lang_utils.set_preset_for_dict(),
        },
      }
      local opts = {
        use_default_keymaps = false,
        max_join_length = 240,
        langs = langs,
      }
      require('treesj').setup(opts)
    end,
  },

  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}
