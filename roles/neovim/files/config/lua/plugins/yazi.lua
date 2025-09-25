return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>E",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<leader>e",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
	},
	opts = {
		-- Automatically open yazi instead of netrw for directories
		open_for_directories = true,
		-- Floating window transparency (0 for opaque, 100 for fully transparent)
		floating_window_winblend = 100,
		-- Customize keymaps for yazi
		keymaps = {
			show_help = "<f1>",
		},
	},
}
