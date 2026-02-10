local M = {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  }
}

M.config = function()
  local neogit = require("neogit")
  neogit.setup({
    config = true
  })
end

return M
