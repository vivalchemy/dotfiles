return {
	"supermaven-inc/supermaven-nvim",
	event = "InsertEnter",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<M-CR>",
				clear_suggestion = "<M-x>",
				accept_word = "<M-w>",
			},
		})
	end,
}
