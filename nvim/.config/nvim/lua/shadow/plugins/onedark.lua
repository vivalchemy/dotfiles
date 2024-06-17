return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  -- dependencies = {
  --   "tribela/vim-transparent",
  -- },
  config = function()
    require("onedark").setup({
      style = "darker",
      term_colors = true,
      transparent = true,
      -- ending_tildes = false,
    })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.cmd("colorscheme onedark")
  end,
}
