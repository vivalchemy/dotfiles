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

----------------
-- Navigation --
----------------

-- Buffer navigation
-- map("n", "<C-o>", ":bnext<CR>", opts)
-- map("n", "<C-i>", ":bprevious<CR>", opts)

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
map("n", "gl", "$", { noremap = true, silent = true, desc = "Move to the end of the line" })
map("n", "gh", "^", { noremap = true, silent = true, desc = "Move to the start of the line" })
map("n", "<leader>Z", "<C-w>_<C-w>|", { noremap = true, silent = true, desc = "Maximize the window" })
map("n", "<leader>z", "<C-w>=", { noremap = true, silent = true, desc = "Equalize the window" })

-- Resizing the windows

map("n", "<C-W>+", "5<C-W>+", opts)
map("n", "<C-W>-", "5<C-W>-", opts)
map("n", "<C-W>>", "5<C-W>>", opts)
map("n", "<C-W><", "5<C-W><", opts)

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
-- map("n", "<leader>x", ExecuteCurrentFile, { desc = "Execute the file in current buffer" })

-------------------
-- Quickfix list --
-------------------
map("n", "<leader>qn", ":cnext<CR>", opts)
map("n", "<leader>qp", ":cprev<CR>", opts)
map("n", "<leader>qs", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-------------------
