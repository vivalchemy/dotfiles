return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 50 })

		-- Add indentation guides even on blank lines
		require("mini.indentscope").setup({
			draw = {
				-- Delay (in ms) between event and start of drawing
				delay = 0,
				animation = require("mini.indentscope").gen_animation.none(),
			},
		})

		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup({
			mappings = {
				add = "<leader>s", -- Add surrounding in Normal and Visual modes
				delete = "<leader>sd", -- Delete surrounding
				find = "<leader>sf", -- Find surrounding (to the right)
				find_left = "<leader>sF", -- Find surrounding (to the left)
				highlight = "<leader>sh", -- Highlight surrounding
				replace = "<leader>sr", -- Replace surrounding
				update_n_lines = "<leader>sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})
		-- require("mini.pairs").setup({
		-- 	modes = { insert = true, command = false, terminal = false },
		
		-- 	-- Global mappings. Each right hand side should be a pair information, a
		-- 	-- table with at least these fields (see more in |MiniPairs.map|):
		-- 	-- - <action> - one of 'open', 'close', 'closeopen'.
		-- 	-- - <pair> - two character string for pair to be used.
		-- 	-- By default pair is not inserted after `\`, quotes are not recognized by
		-- 	-- `<CR>`, `'` does not insert pair after a letter.
		-- 	-- Only parts of tables can be tweaked (others will use these defaults).
		-- 	mappings = {
		-- 		["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
		-- 		["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
		-- 		["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
		
		-- 		[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
		-- 		["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
		-- 		["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
		
		-- 		['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
		-- 		["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
		-- 		["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
		-- 	},
		-- })

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
