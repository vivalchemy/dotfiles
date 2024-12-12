return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>tu", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true })
  end
}
