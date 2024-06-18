-- local options = {
-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs and indentation
vim.opt.shiftwidth = 2   -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2      -- insert 2 spaces for a tab
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.autoindent = true
-- vim.opt.showtabline = 2 -- show the tab name at the top

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = true

-- appearance
vim.opt.termguicolors = true
-- background = "dark",
vim.opt.signcolumn = "yes" -- the column where git signs are displayed

-- backspace
vim.opt.backspace = "indent,eol,start"

-- display space and enter
vim.opt.list = true
vim.opt.listchars = { tab = " ", trail = "·", nbsp = "␣" }

-- clipboard
vim.opt.clipboard = "unnamedplus" -- sync the system and vim clipboard

-- window rules
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- enable mouse
vim.opt.mouse = "a"

-- save undo history
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- reduce file overwrite collisions
vim.opt.writebackup = false

vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
-- }

vim.opt.shortmess:append("c")
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 10
-- for key, value in pairs(options) do
-- vim.opt[key] = value
-- end

vim.cmd("set whichwrap+=<,>,[,],h,l")
-- vim.cmd([[set iskeyword+=-]])
-- @, 48-57, 192-255,_,
--
vim.g.have_nerd_font = true
vim.opt.showmode = false

-- new
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!

vim.filetype.add({ extension = { templ = "templ", rasi = "rasi" } })
