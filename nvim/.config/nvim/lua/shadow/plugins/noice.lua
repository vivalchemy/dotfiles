return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = false, -- long messages will be sent to a split
		},
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search = { kind = "search", pattern = "^[%s?/]", icon = " ", lang = "regex" },
				terminal = { pattern = "^:%s*!", icon = "$", lang = "bash" },
			},
		},
		-- @recording in notification box
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
		},
	},
}
