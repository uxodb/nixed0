local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {}
}

M.config = function()
  local ibl = require("ibl")
  ibl.setup({
    scope = {
      enabled = true,
      show_end = true,
      show_start = true,
    },
  })
end

return M
