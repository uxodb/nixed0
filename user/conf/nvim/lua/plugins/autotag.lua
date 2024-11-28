local M = {
  "windwp/nvim-ts-autotag"
}

M.config = function()
  local autotag = require("nvim-ts-autotag")
  autotag.setup({
    autotag = {
      enable = true,
    },
  })
end

return M
