-- local colorscheme = "tokyonight-moon"
local colorscheme = "catppuccin-mocha"
-- local colorscheme = "catppuccin-mocha"

-- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

