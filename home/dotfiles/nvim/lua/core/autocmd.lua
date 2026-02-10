local keymap = vim.api.nvim_set_keymap
local opts = { silent = true }
-- local function open_nvim_tree(data)

 -- buffer is a real file on the disk
--  local real_file = vim.fn.filereadable(data.file) == 1
--
---- buffer is a [No Name]
--  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
--
--  if not real_file and not no_name then
--    return
--  end

  -- open the tree, find the file but don't focus it
--   require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
-- end
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
--   pattern = "NvimTree_*",
--   callback = function()
--     local layout = vim.api.nvim_call_function("winlayout", {})
--     if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
--   end
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {"ps1", "psm1"},
--   callback = function()
--       vim.schedule(function()
--         vim.api.nvim_buf_set_keymap(0, "n", "<leader>T", lua: require('powershell').toggle_term(), {noremap=true, silent=true})
--         -- keymap("n", "<leader>T", function() require('powershell').toggle_term() end, { silent = true })
--         -- keymap("n", "<leader>E", function() require('powershell').eval() end, opts)
--       end)
--   end,
-- })
--
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("NeotreeOnOpen", { clear = true }),
    once = true,
    callback = function(_)
        if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) ~= 1 then
            if vim.fn.winwidth("%") >= 120 then
                vim.cmd("Neotree")
                vim.cmd("wincmd p")
            end
        end
    end,
})

-- vim.fn.sign_define("DiagnosticSignError",
-- {text = " ", texthl = "DiagnosticSignError"})
-- vim.fn.sign_define("DiagnosticSignWarn",
-- {text = " ", texthl = "DiagnosticSignWarn"})
-- vim.fn.sign_define("DiagnosticSignInfo",
-- {text = " ", texthl = "DiagnosticSignInfo"})
-- vim.fn.sign_define("DiagnosticSignHint",
-- {text = "󰌵", texthl = "DiagnosticSignHint"})

vim.diagnostic.config({
  signs = {
    --support diagnostic severity / diagnostic type name
    text = { [1] = 'e', ['WARN'] = ' ', ['HINT'] = '󰌵', ['INFO'] = " ", ['ERROR'] = " " },
  },
})
