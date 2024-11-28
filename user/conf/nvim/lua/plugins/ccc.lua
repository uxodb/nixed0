local M = {
  "uga-rosa/ccc.nvim"
}

M.config = function()
  local ccc = require("ccc")
  ccc.setup({
    preserve = true,
    empty_point_bg = false,

  })
end
return M

-- toggle input mode           i
-- toggle output mode          o
-- reset mode                  r
-- toggle transparancy         a
-- toggle prev colors          g
-- goto next color             w
-- goto prev color             b
-- goto last color             W
-- goto first color            B

