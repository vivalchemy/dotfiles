return {
	"google/executor.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		split = {
			size = math.floor(vim.o.columns * 0.3),
		},
	},
	init = function()
		local executor = require("executor")
		vim.keymap.set("n", "<leader>x", function()
			vim.api.nvim_command("write")
			executor.commands.run()
			executor.commands.show_detail()
			Snacks.notifier.hide()
		end, {})
		vim.keymap.set("n", "<leader>tx", require("executor").commands.toggle_detail, {})
		vim.keymap.set("n", "<leader>rx", require("executor").commands.set_command, {})
	end,
}
