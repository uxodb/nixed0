local M = {
  "akinsho/toggleterm.nvim"
}

M.config = function()
  local toggleterm = require("toggleterm")
  toggleterm.setup({
    open_mapping = [[<c-\>]],
    autochdir = false,
  })
end

return M
