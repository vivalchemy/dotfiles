return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		-- Key mappings for yazi.nvim
		{
			"<leader>E",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>-",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
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
