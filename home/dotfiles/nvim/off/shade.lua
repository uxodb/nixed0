local M = {
  "sunjon/shade.nvim"
}

M.config = function()
  local shade = require("shade")
  shade.setup({
  overlay_opacity = 70,
  opacity_step = 1,
  })
end

return M

-- :Mason window doesnt appear with this enabled
