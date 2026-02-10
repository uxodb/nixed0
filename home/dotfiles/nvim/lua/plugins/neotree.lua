local M = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
}

M.config = function ()
  local neotree = require("neo-tree")
  neotree.setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    source_selector = {
      winbar = true,
      statusline = false
    },
    window = {
      mappings = {
        ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
        ['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
        ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
      },
    },
    default_component_configs = {
      diagnostics = {
        symbols = {
          hint = "󰌵",
          info = " ",
          warn = " ",
          error = " ",
        },
        highlights = {
          hint = "DiagnosticSignHint",
          info = "DiagnosticSignInfo",
          warn = "DiagnosticSignWarn",
          error = "DiagnosticSignError",
        },
      },
    }
  })
end

return M

