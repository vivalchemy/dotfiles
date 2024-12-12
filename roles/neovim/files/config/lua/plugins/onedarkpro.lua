return {
	"olimorris/onedarkpro.nvim",
	lazy = false,
	priority = 1000, -- Ensure it loads first
	opts = {
		colors = {
			bg = "#0a0a0a",
		},
		highlights = {
			Pmenu = { bg = NONE },
			Folded = { fg = "${fg}" },

			-- GitSigns
			GitSignsAdd = { fg = "${green}" },
			GitSignsChange = { fg = "${blue}" },
			GitSignsChangedelete = { fg = "${blue}" },
			GitSignsDelete = { fg = "${red}" },
			GitSignsTopdelete = { fg = "${red}" },

			-- Render Markdown
			["@markup.list.checked"] = { bg = NONE, fg = "${green}" },
			["@markup.list.todo"] = { bg = NONE, fg = "${blue}" },
			["@markup.list.unchecked"] = { bg = NONE, fg = "${red}" },
			RenderMarkdownBullet = { bg = NONE, fg = "${blue}" },
			RenderMarkdownDahs = { bg = NONE, fg = "${blue}" },
			RenderMarkdownCode = { bg = NONE },
			RenderMarkdownCodeBlock = { bg = NONE },
			RenderMarkdownCodeInline = { bg = NONE },

			-- Telescope
			TelescopeTitle = { fg = "${fg}" },
			TelescopeSelectionCaret = { fg = "${white}" },
			TelescopeSelection = { fg = "${blue}" },
			TelescopeMatching = { fg = "${yellow}" },
			TelescopePromptPrefix = { fg = "${blue}" },
			TelescopePromptCounter = { fg = "${fg}" },
		},
		options = {
			transparency = true,
			terminal_colors = false,
		},
	},
	config = function(_, opts)
		require("onedarkpro").setup(opts)
		vim.cmd("colorscheme onedark_dark")
	end,
}
