return {
	"rcarriga/nvim-notify",
	opts = {
		-- other stuff
		background_colour = "#000000",
		timeout = 3000,
		level = vim.log.levels.INFO,
		render = "wrapped-compact",
		max_width = function()
			return math.floor(vim.o.columns * 0.5)
		end,
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { focusable = false })
		end,
	},
}
