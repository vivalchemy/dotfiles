-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

	if not vim.loop.fs_stat(lazypath) then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ result, "WarningMsg" },
			{ "\nPress any key to exit...", "WarningMsg" },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = LAZY_PLUGIN_SPEC, -- Define this table elsewhere with your plugin specifications
	ui = {
		border = "rounded", -- Rounded border for the UI
		icons = {
			loaded = " ",
			not_loaded = " ",
		},
	},
	-- Uncomment these options if required
	-- change_detection = {
	--     enabled = true, -- Automatically detect changes in plugin configuration
	--     notify = false, -- Disable notifications (optional)
	-- },
	-- checker = {
	--     enabled = true, -- Enable periodic plugin updates check
	-- },
})
