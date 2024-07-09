local vim = vim

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      config = true,
    },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      'j-hui/fidget.nvim',
      event = 'VeryLazy',
      opts = {
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
  },
  config = function()
    -- Sign configuration
    vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        local vmap = function(keys, func, desc)
          vim.keymap.set('v', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        local imap = function(keys, func, desc)
          vim.keymap.set('i', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('<leader>rn', function()
          vim.lsp.buf.rename()
        end, '[R]e[n]ame')

        map('<leader>ca', function()
          vim.lsp.buf.code_action()
        end, '[C]ode [A]ction')
        vmap('<leader>ca', function()
          vim.lsp.buf.code_action()
        end, '[C]ode [A]ction')

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        map('<leader>fs', require('telescope.builtin').lsp_document_symbols, '[F]ind [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        map('K', function()
          vim.lsp.buf.hover()
        end, 'Hover Documentation')
        map('<M-k>', function()
          vim.lsp.buf.signature_help()
        end, 'Signature Documentation')

        -- Lesser used LSP functionality
        map('gD', function()
          vim.lsp.buf.declaration()
        end, '[G]oto [D]eclaration')
        map('<leader>wa', function()
          vim.lsp.buf.add_workspace_folder()
        end, '[W]orkspace [A]dd Folder')
        map('<leader>wr', function()
          vim.lsp.buf.remove_workspace_folder()
        end, '[W]orkspace [R]emove Folder')
        map('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        -- Diagnostic
        map(']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
        map('[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
        map('<leader>df', vim.diagnostic.open_float, 'floating diagnostic message')
        map('<leader>dl', vim.diagnostic.setloclist, 'Open diagnostics list')

        imap('<C-d>', vim.lsp.buf.signature_help, 'Show signature help')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>ti', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, '[T]oggle [I]nlay Hints')
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local servers = {
      clangd = {},
      gopls = {},
      lua_ls = {},
      pyright = {},
      bashls = {},
    }

    require('mason').setup()
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
      'black',
      'isort',
      'shfmt',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
