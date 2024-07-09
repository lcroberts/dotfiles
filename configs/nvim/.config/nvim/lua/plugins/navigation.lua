local vim = vim

return {
  {
    'christoomey/vim-tmux-navigator',
    event = "VeryLazy",
  },
  {
    'ThePrimeagen/harpoon',
    event = 'VeryLazy',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      settings = {
        save_on_toggle = true,
        save_on_ui_close = true,
      },
    },
    config = function(_, opts)
      local harpoon = require 'harpoon'

      harpoon:setup(opts)
      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<leader>hl', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end)
      vim.keymap.set('n', '<leader>5', function()
        harpoon:list():select(5)
      end)
    end,
  },

  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    opts = {
      keymaps = {
        ['<BS>'] = 'actions.parent',
        ['.'] = 'actions.cd',
      },
      view_options = {
        show_hidden = true,
      },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function(_, opts)
      require('oil').setup(opts)
      vim.keymap.set({ 'n' }, '<leader>fv', '<cmd>Oil<cr>', { desc = 'Open fileview' })
    end,
  },
}
