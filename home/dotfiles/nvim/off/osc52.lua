local M = {
  "ojroques/nvim-osc52",
  vim.keymap.set("n", "<leader>c", require('osc52').copy_operator, {expr = true}),
  vim.keymap.set("n", "<leader>cc", "<leader>c_", {remap = true}),
  vim.keymap.set("v", "<leader>c", require('osc52').copy_visual),
}

M.config = function()
  local osc = require("osc52")
  osc.setup({
    max_length = 0,
    silent = false,
    trim = false,
  })
end

return M

