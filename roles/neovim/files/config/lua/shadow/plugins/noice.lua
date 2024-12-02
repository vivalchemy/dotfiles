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
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { kind = "terminal", pattern = "^:%s*!", icon = " ", lang = "bash" },
				normal_terminal = { kind = "terminal", pattern = "^:%s*!", icon = " ", lang = "bash" },
				number_terminal = { kind = "terminal", pattern = "^:%s*%d*,%d*%s*!%s*", icon = " ", lang = "bash" },
				range_terminal = { kind = "terminal", pattern = "^:%s*'<,'>%s*!%s*", icon = " ", lang = "bash" },
				normal_replace = { kind = "global_Replace", pattern = "^:%s*%%s/", icon = "󰯍 ", lang = "bash" },
				number_replace = { kind = "replace", pattern = "^:%s*%d*,%d*%s*s/", icon = "󰯍 ", lang = "bash" },
				range_replace = { kind = "replace", pattern = "^:%s*'<,'>%s*s/", icon = "󰯍 ", lang = "bash" },
				line_replace = { kind = "replace", pattern = "^:%s*s/", icon = "󰯍 ", lang = "bash" },
			},
		},
		-- @recording in notification box
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
			{
				view = "split",
				filter = { event = "msg_show", min_height = 5, min_width = 50 },
			},
		},
	},
}
