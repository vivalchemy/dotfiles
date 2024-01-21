local options = {
	-- line numbers
	number = true,
	relativenumber = true,

	-- tabs and indentation
	shiftwidth = 2,                          -- the number of spaces inserted for each indentation
	tabstop = 2,                             -- insert 2 spaces for a tab
	expandtab = true,                        -- convert tabs to spaces
	autoindent = true,
	showtabline = 2,

	-- line wrapping
	wrap = false,

	-- search settings
	hlsearch = false,
	ignorecase = true,
	smartcase = true,

	-- cursor line
	cursorline = true,

	-- appearance 
	termguicolors = true,
	-- background = "dark",
	signcolumn = "yes", -- the column where git signs are displayed

	-- backspace
	backspace = "indent,eol,start",

	-- clipboard
	clipboard = "unnamedplus",-- sync the system and vim clipboard

	-- window rules
	splitbelow = true,
	splitright = true,
	scrolloff = 8,
	sidescrolloff = 8,

	-- save undo history
	undofile = true,

	-- Decrease update time
	updatetime = 250,
	timeoutlen = 300,

	-- set completeopt to have a better completion experience
	completeopt = "menuone,noselect",

	-- reduce file overwrite collisions
	writebackup = false,

	cmdheight = 1,                           -- more space in the neovim command line for displaying messages
}


vim.opt.shortmess:append "c"
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 10

-- print("Setting options in Lua configuration...")
for key, value in pairs(options) do
	-- print("Setting option:", key, "to value:", value)
	vim.opt[key] = value
end
-- print("Options set successfully!")

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
