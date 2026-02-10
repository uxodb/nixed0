local M = {
  "akinsho/bufferline.nvim",
  after = "catppuccin",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  }
}

M.config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'NeoTree',
          text_align = 'center',
          highlight = 'Directory',
        },
      },
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
        mode = "tabs", --buffers
        themable = true,
        numbers = "none",
        indicator = {
          icon = '▎',
          style = 'icon',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_tab_indicators = true,
        always_show_bufferline = true,
        seperator_style = "thin",
      }
    })
  end

return M
