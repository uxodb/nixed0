-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local set = vim.opt

set.termguicolors = true                                -- set termguicolors
set.shiftwidth = 2                                      -- number of spaces inserted for each indent
set.smarttab = true
set.expandtab = true                                    -- convert tab to spaces
set.tabstop = 8                                         -- insert x spaces for a tab
set.softtabstop = 0
set.list = true
set.showmatch = true
set.cursorline = true                                   -- highlight current active line
set.ignorecase = true                                   -- ignore case when searching
set.autoindent = true                                   -- auto indent
set.smartindent = true                                  -- make indenting smarter
set.number = true                                       -- show linenumbers
set.splitbelow = true                                   -- open new file with hsplit below
set.splitright = true                                   -- open new file with vsplit on the right
set.clipboard = "unnamedplus"          -- allows nvim to access system clipboard
set.conceallevel = 0                                    -- so that `` is visible in markdown files
set.fileencoding = "utf-8"                              -- the encoding written to a file
set.hlsearch = true                                     -- highlight all matches on previous search pattern
set.showmode = true                                     -- Show mode like INSERT, NORMAL
set.swapfile = false                                    -- creates a swapfile
set.timeoutlen = 1000                                   -- time to wait for a mapped sequence to complete in ms
set.relativenumber = false                              -- show relative linenumbers
set.numberwidth = 4                                     -- set number column width to 4 (default: 4)


--vim.g.clipboard = {
--   name = 'WslClipboard',
----   copy = {
----      ['+'] = copy,
----      ['*'] = copy,
----    },
--   paste = {
--      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
--     cache_enabled = true,
--   }
--

