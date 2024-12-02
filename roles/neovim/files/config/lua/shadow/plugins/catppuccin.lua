return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin")
		require("catppuccin").setup({
			flavour = "mocha",
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
