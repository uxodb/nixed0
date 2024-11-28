return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function ()
    require("tokyonight").setup({
      style = "moon",
      transparent = false,
      terminal_colors = true,
    })
  end,
}
