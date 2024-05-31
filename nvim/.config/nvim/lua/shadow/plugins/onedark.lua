return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "tribela/vim-transparent",
  },
  config = function()
    vim.cmd("colorscheme onedark")
    require("onedark").setup({
      style = "dark",
      transparent = true,
    })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
}
