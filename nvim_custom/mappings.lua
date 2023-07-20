local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigatorLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigatorRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigatorDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigatorUp<CR>", "window up" },
  }
}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint",
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

return M
