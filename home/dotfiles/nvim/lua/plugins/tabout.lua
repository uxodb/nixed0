local M = {
  "abecodes/tabout.nvim",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "nvim-treesitter/nvim-treesitter",
    "windwp/nvim-autopairs" 
  },
}

M.config = function()
  local tabout = require("tabout")
  tabout.setup({
    tabkey = '<Tab>',
    backwards_tabkey = '<S-Tab>',
    act_as_tab = true,
    act_as_shift_tab = false,
--    completion = true,
    tabouts = {
      {open = "'", close = "'"},
      {open = '"', close = '"'},
      {open = '`', close = '`'},
      {open = '(', close = ')'},
      {open = '[', close = ']'},
      {open = '{', close = '}'},
 --     {open = "<", close = ">"}
    },
    exclude = {},
  })
end

return M

