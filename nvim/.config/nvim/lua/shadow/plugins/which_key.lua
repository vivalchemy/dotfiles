return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup()
		require("which-key").add({
			{ "<leader>c", group = "[C]ode" }, -- group
			-- { "<leader>d", group = "[D]ocument" }, -- group
			{ "<leader>r", group = "[R]ename" }, -- group
			{ "<leader>f", group = "[F]ind" }, -- group
			{ "<leader>w", group = "[W]orkspace" }, -- group
			{ "<leader>t", group = "[T]oggle" }, -- group
			{ "<leader>g", group = "[G]it" }, -- group
			-- { "<leader>c_", hidden = true }, -- hide this keymap
			-- { "<leader>d_", hidden = true }, -- hide this keymap
			-- { "<leader>r_", hidden = true }, -- hide this keymap
			-- { "<leader>s_", hidden = true }, -- hide this keymap
			-- { "<leader>w_", hidden = true }, -- hide this keymap
			-- { "<leader>t_", hidden = true }, -- hide this keymap
			-- { "<leader>g_", hidden = true }, -- hide this keymap
		})
		-- Document existing key chains
		-- require("which-key").register({
		-- 	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
		-- 	["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
		-- 	["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
		-- 	["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
		-- 	["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
		-- 	["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
		-- 	["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
		-- })
		-- visual mode
		-- require("which-key").register({
		-- 	["<leader>h"] = { "Git [H]unk" },
		-- }, { mode = "v" })
	end,
}
