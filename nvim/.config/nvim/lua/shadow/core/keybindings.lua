-- Remap sapce as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- remove highlight on escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagonostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

--------------
-- Terminal --
--------------

-- opening and closing the terminal
vim.keymap.set("n", "<C-t>", "<CMD>FloatermToggle!<CR>", opts)
vim.keymap.set("t", "<C-t>", "<C-\\><C-n><CMD>FloatermToggle!<CR>", opts)

-- when the float term is not available
-- vim.keymap.set("t", "<C-t>", "<C-\\><C-n>:q<CR>", opts)
-- Better terminal navigations
-- vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- lazy git
vim.keymap.set("n", "<leader>lg", "<cmd>FloatermNew lazygit<CR>", opts)

----------------
-- Navigation --
----------------

-- Buffer navigation
vim.keymap.set("n", "<C-o>", ":bnext<CR>", opts)
vim.keymap.set("n", "<C-i>", ":bprevious<CR>", opts)

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", opts)

-- Center the text when searching
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "*", "*zz", opts)
vim.keymap.set("n", "#", "#zz", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)

------------
-- Visual --
------------

-- Selection bindings
-- vim.keymap.set("v", "a", "<Esc>:0<CR><S-v><S-g>", opts)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- remove highlight on escape
vim.keymap.set("x", "p", [["_dP]], term_opts)
-- map("v", "p", [["_dP]], term_opts) -- bit buggy
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text
vim.keymap.set("v", "<S-k>", ":move +1<CR>")
vim.keymap.set("v", "<S-j>", ":move -2<CR>")

-- Execute the current file in the buffer
vim.keymap.set("n", "<leader>x", ExecuteCurrentFile, { desc = "Execute the file in current buffer" })

-- TODO:Delete this after use --
-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
