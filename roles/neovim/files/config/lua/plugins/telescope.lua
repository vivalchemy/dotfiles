return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-tree/nvim-web-devicons",
			enabled = vim.g.have_nerd_font or true,
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local themes = require("telescope.themes")

		telescope.setup({
			defaults = {
				prompt_prefix = "   ",
				file_ignore_patterns = { "node_modules", "%.git" },
				vimgrep_arguments = {
					"rg",
					"--hidden",
					"--follow",
					"--smart-case",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				mappings = {
					i = {
						["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
					n = {
						["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0, -- no preview
						results_width = 0.8,
					},
					width = 0.6,
					height = 0.7,
				},
			},
			pickers = {
				find_files = {
					find_command = {
						"fd",
						"--type",
						"file",
						"--hidden",
						"--follow",
						"--no-ignore",
						"--exclude",
						"{.git,node_modules,__pycache__,.next,.venv,target}",
					},
				},
				live_grep = {
					additional_args = {
						"--hidden",
						"--follow",
						"--smart-case",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
					},
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown(),
				},
			},
		})

		-- Load extensions
		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		-- Set up keymappings
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap.set

		keymap("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		keymap("n", "<leader>?", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		keymap("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		keymap("n", "<leader>ff", builtin.git_files, { desc = "[F]ind Git [F]iles" })
		keymap("n", "<leader><leader>", builtin.find_files, { desc = "[F]ind [F]iles" })
		keymap("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
		keymap("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
		keymap("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
		keymap("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		keymap("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
		keymap("n", "<leader>f.", builtin.oldfiles, { desc = "[F]ind Recent Files" })
		keymap("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [B]uffers" })

		keymap("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 10, previewer = false }))
		end, { desc = "[F]ind in Current Buffer" })

		keymap("n", "<leader>f/", function()
			builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
		end, { desc = "[F]ind [/] in Open Files" })

		keymap("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[F]ind [N]eovim Config Files" })

		keymap("n", "<leader>-", function()
			builtin.find_files({
				cwd = vim.fn.getcwd(),
				find_command = { "fd", "--type", "directory", "--follow", "--hidden" },
				prompt_title = "Directories",
			})
		end, { desc = "[E]xplore Directories" })
	end,
}
