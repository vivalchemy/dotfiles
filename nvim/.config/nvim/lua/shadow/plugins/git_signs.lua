return {
  -- Adds git related signs to the gutter, as well as utilities for managing
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  -- config = function()
  --   require("gitsigns").setup()
  -- end,
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    }
  }
}
