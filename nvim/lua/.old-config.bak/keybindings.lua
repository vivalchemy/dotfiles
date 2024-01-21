-- Remap <Space> as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.api.nvim_set_keymap

map("", "<Space>", "<Nop>", opts)
-- map("i", "jk", "<Esc>", opts) -- swapped capslock key to esc so no need currently
-- map("i", "kj", "<Esc>", opts)
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Open file explorer
map("n", "<leader>e", ":Lex 23<CR> jj", opts)
-- map("n", "<leader>e", ToggleNetrw ,opts)
-- map("n", "<leader>s", "/", opts)
-- map("n", "<leader>r", ":%s/", opts)

-- Visual --
-- Selection bindings
map("v", "a", "<Esc>:0<CR><S-v><S-g>", opts)

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

-- Telescope --
-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>f/", Telescope_live_grep_open_files, { desc = "[F]ind [/] in Open Files" })
vim.keymap.set("n", "<leader>fs", require("telescope.builtin").builtin, { desc = "[F]ind [S]elect Telescope" })
vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fG", ":LiveGrepGitRoot<cr>", { desc = "[F]ind by [G]rep on Git Root" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume, { desc = "[F]ind [R]esume" })

-- document existing key chains
require("which-key").register({
	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
	["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
	["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
	["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
	["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
	["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
	["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
	["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
})
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require("which-key").register({
	["<leader>"] = { name = "VISUAL <leader>" },
	["<leader>h"] = { "Git [H]unk" },
}, { mode = "v" })

--[[null_ls]]
--
vim.keymap.set("n", "<leader>fmt", vim.lsp.buf.format, { desc = "[F]or[m]a[t] File" })
vim.keymap.set("n", "<leader>x", ExecuteCurrentFile, {desc = "Execute the file in current buffer"} )
