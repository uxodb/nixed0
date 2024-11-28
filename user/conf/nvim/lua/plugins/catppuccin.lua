local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000
}
-- return { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
--
M.config = function ()
  local catppuccin = require("catppuccin")
  catppuccin.setup({
    -- transparant_background = false,
    dim_inactive = {
      enabled = true,
      shade = "dark",
      percentage = 0.15,
    },
    integrations = {
      cmp = true,
      treesitter = true,
      notify = true,
      neotree = true,
      neogit = true,
      noice = true,
      octo = true,
      rainbow_delimiters = true,
      which_key = true,
      telescope = true,
    }
  })
  
end

return M
