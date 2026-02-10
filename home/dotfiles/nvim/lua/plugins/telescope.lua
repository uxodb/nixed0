return {
  "nvim-telescope/telescope.nvim", 
  branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find text" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List opened buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help tags" },
    { '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'Recently opened files' },
  }

}
