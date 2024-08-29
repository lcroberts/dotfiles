return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
    opts = {
      luarocks_build_args = {
        '--with-lua-include=/usr/include',
      },
    },
  },
  {
    'nvim-neorg/neorg',
    version = '*',
    event = 'VeryLazy',
    dependencies = {
      'luarocks.nvim',
      'nvim-neorg/neorg-telescope',
      'nvim-lua/plenary.nvim',
      {
        'jmbuhr/otter.nvim',
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
        },
        opts = {},
      },
    },
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {
            config = {
              icon_preset = 'diamond',
            },
          },
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          },
          ['core.ui.calendar'] = {},
          ['core.summary'] = {
            config = {
              strategy = 'by_path',
            },
          },
          ['core.qol.toc'] = {
            config = {
              auto_toc = {
                open = true,
                close = true,
              },
              enter = false,
            },
          },
          ['core.integrations.telescope'] = {
            config = {
              insert_file_link = {
                show_title_preview = true,
              },
            },
          },
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/OneDrive/neorg/notes',
                todo = '~/OneDrive/neorg/todo',
              },
              default_workspace = 'notes',
            },
          },
          ['core.export'] = {},
          ['core.esupports.metagen'] = {
            config = {
              author = 'Logan Roberts',
              update_date = true,
            },
          },
          ['core.keybinds'] = {},
          ['core.integrations.otter'] = {},
        },
      }

      vim.wo.foldlevel = 99
      vim.keymap.set({ 'n' }, '<leader>ni', '<cmd>Neorg index<cr>', { desc = 'Neorg index' })
      vim.keymap.set({ 'n' }, '<leader>nr', '<cmd>Neorg return<cr>', { desc = 'Neorg return' })
      vim.keymap.set('n', '<leader>nw', '<cmd>Telescope neorg switch_workspace<cr>', { desc = 'Telescope neorg workspace' })
      vim.keymap.set({ 'n' }, '<leader>fn', '<cmd>Telescope neorg find_norg_files<cr>', { desc = 'Find norg files' })
      vim.keymap.set({ 'n' }, '<leader>oa', require('otter').activate, { desc = 'Activate otter.nvim' })
    end,
  },
}
