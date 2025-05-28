-- vim.opt = vimOpts
local vimOpts = {
	-- line numbers
	number = true,
	relativenumber = true,

	-- tabs and indentation
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	expandtab = true, -- convert tabs to spaces
	autoindent = true,
	showtabline = 1, -- show the tab name at the top

	-- line wrapping
	wrap = false,

	-- search settings
	hlsearch = true,
	ignorecase = true,
	smartcase = true,

	-- cursor line
	-- cursorline = true,

	-- appearance
	termguicolors = true,
	-- background = "dark",
	signcolumn = "yes", -- the column where git signs are displayed
	colorcolumn = "81",

	-- backspace
	backspace = "indent,eol,start",

	-- display space and enter
	list = true,
	listchars = { tab = " ", trail = "·", nbsp = "␣" },

	-- clipboard
	clipboard = "unnamedplus", -- sync the system and vim clipboard

	-- window rules
	splitbelow = true,
	splitright = true,
	scrolloff = 8,
	sidescrolloff = 8,

	-- enable mouse
	mouse = "n",

	-- save undo history
	undofile = true,

	-- Decrease update time
	updatetime = 250,
	timeoutlen = 1000,

	-- set completeopt to have a better completion experience
	completeopt = "menuone,noselect",

	-- reduce file overwrite collisions
	writebackup = false,

	cmdheight = 1, -- more space in the neovim command line for displaying messages
	showmode = false,
	inccommand = "split", -- Preview substitutions live, as you type!

	-- fold settings
	foldlevelstart = 99, -- open fold on startup

	-- disable the swapfiles
	swapfile = false,
}

-- vim.g = vimG
local vimG = {
	netrw_liststyle = 3,
	netrw_banner = 0,
	netrw_winsize = 10,
	have_nerd_font = true,
}

vim.opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
-- vim.cmd([[set iskeyword-=_]])
-- @, 48-57, 192-255,_,
--

vim.filetype.add({ extension = { templ = "templ", rasi = "rasi" } })

SetOptions(vimOpts, "opt")
SetOptions(vimG, "g")

-- Reset jumplist on launching neovim
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("clearjumps")
	end,
})
