-- Remap <Space> as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require ("vivalchemy.core.functions")

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

map("", "<Space>", "<Nop>", opts)

-- map("i", "jk", "<Esc>", opts) -- swapped capslock key to esc so no need currently
-- map("i", "kj", "<Esc>", opts)
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
-- map("n", "<C-j>", "<C-w>j", opts)
-- map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
map("n", "<C-o>", ":bnext<CR>", opts)
map("n", "<C-i>", ":bprevious<CR>", opts)

-- Open file explorer
map("n", "<leader>e", ":Ex<CR> jj", opts)
-- map("n", "<leader>e", ToggleNetrw ,opts)
-- map("n", "<leader>s", "/", opts)
-- map("n", "<leader>r", ":%s/", opts)

-- Visual --
-- Selection bindings
map("v", "a", "<Esc>:0<CR><S-v><S-g>", opts)

map("x", "p", [["_dP]], term_opts)
-- map("v", "p", [["_dP]], term_opts) -- bit buggy
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down(currently buggy)
-- map("x", "J", ":move '>+1<CR>gv-gv", opts)
-- map("x", "K", ":move '<-2<CR>gv-gv", opts)
-- map("v", "<S-k>", "<S-v>:move '<-2<CR>gv-gv", opts)
-- map("v", "<S-j>", "<S-v>:move '>+1<CR>gv-gv", opts)

-- Terminal --
-- opening and closing the terminal
map("n", "<C-t>", ":split<CR>:terminal<CR>i", opts)
map("t", "<C-t>", "<C-\\><C-n>:q<CR>", opts)
-- Better terminal navigations
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Center the text when searching
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)
map("n", "g#", "g#zz", opts)

-- Line navigation
-- map({ "n", "v", "x", "t" }, "w", "<S-w>", opts) -- navigate by space withing words
map({ "n", "v", "x", "t" }, "b", "<S-b>", opts) -- navigate by space withing words
map({ "n", "v", "x", "t" }, "e", "<S-e>", opts) -- navigate by space withing words
map({ "n", "v", "x", "t" }, "<S-e>", "$", opts) -- navigate by space withing words
map({ "n", "v", "x", "t" }, "<S-b>", "_", opts) -- navigate by space withing words

vim.keymap.set("n", "<leader>x", ExecuteCurrentFile, { desc = "Execute the file in current buffer" })
-- print("Reached keybindings.lua")
