-- Remap sapce as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.keymap.set

-- remove highlight on escape
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagonostic keymaps
-- map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

--------------
-- Terminal --
--------------

-- opening and closing the terminal
-- map("n", "<leader>tt", "<CMD>FloatermToggle!<CR>", opts)
-- map("t", "<leader>tt", "<C-\\><C-n><CMD>FloatermToggle!<CR>", opts)

-- when the float term is not available
map("n", "<C-t>", "<cmd>split<CR><cmd>term<CR>iclear<CR>", opts)
map("t", "<C-t>", "<C-\\><C-n>:bd!<CR>", opts)
-- Better terminal navigations
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- lazy git
-- map("n", "<leader>gl", "<cmd>FloatermNew lazygit<CR>", opts)

----------------
-- Navigation --
----------------

-- Buffer navigation
map("n", "<C-o>", ":bnext<CR>", opts)
map("n", "<C-i>", ":bprevious<CR>", opts)

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
map("n", "gl", "$", { noremap = true, silent = true, desc = "Move to the end of the line" })
map("n", "gh", "^", { noremap = true, silent = true, desc = "Move to the start of the line" })

map("n", "<leader>e", ":lua MiniFiles.open()<CR>", opts)

-- Center the text when searching
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)
map("n", "g#", "g#zz", opts)

------------
-- Visual --
------------

-- Selection bindings
-- map("v", "a", "<Esc>:0<CR><S-v><S-g>", opts)
map("n", "<Esc>", "<cmd>nohlsearch<CR>") -- remove highlight on escape
map("x", "p", [["_dP]], term_opts)
-- map("v", "p", [["_dP]], term_opts) -- bit buggy
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text
map("v", "<S-k>", ":move +2<CR>gv")
map("v", "<S-j>", ":move -2<CR>gv")

-- Execute the current file in the buffer
map("n", "<leader>x", ExecuteCurrentFile, { desc = "Execute the file in current buffer" })

-- TODO:Delete this after use --
-- TIP: Disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
