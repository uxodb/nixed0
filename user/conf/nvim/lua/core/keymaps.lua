local opts = { noremap = true, silent = true }
local global = vim.g
local keymap = vim.api.nvim_set_keymap
-- local pwsh = require "powershell"
keymap("", "<Space>", "<Nop>", opts) 
global.mapleader = ' '
global.maplocalleader = ' '

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Normal Mode --
-- Move window with CTRL+<hjkl>
-- keymap("n", "<C-h>", "<C-w><S-h>", opts)
-- keymap("n", "<C-j>", "<C-w><S-j>", opts)
-- keymap("n", "<C-k>", "<C-w><S-k>", opts)
-- keymap("n", "<C-l>", "<C-w><S-l>", opts)
-- Window Navigation with CTRL+<Arrows>
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize with Shift+arrows
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate tabs with <LH>
--keymap("n", "<S-l>", ":tabnext<CR>", opts)
--keymap("n", "<S-h>", ":tabprevious<CR>", opts)
keymap("n", "<S-C-Left>", ":tabprevious<CR>", opts)
keymap("n", "<S-C-Right>", ":tabnext<CR>", opts)
keymap("n", "<leader>ca", ":tabclose<CR>",opts)

-- Visual Mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down jk and arrows
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-Up>", ":m .-2<CR>==", opts)
keymap("v", "<A-Down>", ":m .+2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts) -- Paste X over A, then when you paste it pastes X instead of A

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- keymap("n", "n", "<nop>", opts)
keymap("n", "<leader>nh", ":NoiceHistory<CR>", opts)
-- keymap("n", "<leader><BS>", ":undo<CR>", opts)
keymap("n", "<leader>nt", ":NvimTreeToggle<CR>", opts)
keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", opts)
keymap("n", "<leader>ds", "<cmd>lua require('dapui').setup()<CR>", opts)

keymap("n", "<leader>ng", ":Neogit<CR>", opts)
-- keymap("n", "<leader>E", ":ToggleTermSendVisualSelection <T_ID>", opts)

-- keymap("n", "<leader>E", pwsh.eval, opts)
-- keymap("n", "<leader>ps", pwsh.toggle_term, opts)
-- keymap("n", "<leader>ps", function() require('powershell').toggle_term() end, opts)
-- keymap("n", "<leader>E", function() require('powershell').eval() end, opts)

-- NvimTreeMappings
-- Backspace = leave folder
-- CTRL+k show info on object
-- CTRL + ] _or_ <leader>+Enter         = cd into folder
-- CTRL + t _or_ <leader>+t             = open file in new tab
-- CTRL + v _or_ <leader>+v             = open file in vsplit
-- CTRL + x _or_ <leader>+x             = open file in hsplit
-- CTRL + t                             = open file in new tab
-- Enter                                = open (replace in tab)
-- Tab                                  = preview file
-- a                                    = create
-- e                                    = rename basename
-- r                                    = rename
-- m                                    = toggle bookmark
-- R                                    = refresh
-- x                                    = cut file
-- c                                    = copy file
-- p                                    = paste file
--
-- ##################
-- #-- Commenting --#
-- ##################
-- ------------------
-- |  Normal Mode   |
-- ------------------
-- gcc                  = Toggle linewise comment on current line 
-- gbc                  = Toggle blockwise comment on current linewise
-- [count]gcc/gbc       = Toggle x/x on X number of lines from cursor
--
-- ------------------
-- | Visual Mode    |
-- ------------------
-- gc                   = Toggle linewise comment on current selection
-- gb                   = Toggle blockwise comment on current selection
--
-- -- Examples
-- `gcw` - Toggle from the current cursor position to the next word
-- `gc$` - Toggle from the current cursor position to the end of line
-- `gc}` - Toggle until the next blank line
-- `gc5j` - Toggle 5 lines after the current cursor position
-- `gc8k` - Toggle 8 lines before the current cursor position
-- `gcip` - Toggle inside of paragraph
-- `gca}` - Toggle around curly brackets
--
-- # Blockwise
--
-- `gb2}` - Toggle until the 2 next blank line
-- `gbaf` - Toggle comment around a function (w/ LSP/treesitter support)

