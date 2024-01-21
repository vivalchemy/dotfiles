-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
	-- Use the current buffer's path as the starting point for the git search
	local current_file = vim.api.nvim_buf_get_name(0)
	local current_dir
	local cwd = vim.fn.getcwd()
	-- If the buffer is not associated with a file, return nil
	if current_file == "" then
		current_dir = cwd
	else
		-- Extract the directory from the current file's path
		current_dir = vim.fn.fnamemodify(current_file, ":h")
	end

	-- Find the Git root directory from the current file's path
	local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
	if vim.v.shell_error ~= 0 then
		print("Not a git repository. Searching on current working directory")
		return cwd
	end
	return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
	local git_root = find_git_root()
	if git_root then
		require("telescope.builtin").live_grep({
			search_dirs = { git_root },
		})
	end
end

vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

function Telescope_live_grep_open_files()
	require("telescope.builtin").live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end

function ExecuteCurrentFile()
	-- Define a table that maps file extensions to execution commands
	local fileExtensionCommands = {
		c = "!gcc % && ./a.out",
		cpp = "!g++ % && ./a.out",
		py = "!python3 %", -- Use "python3" for Python files
		sh = "!chmod +x % && %"
	}

	-- Get the file extension of the current file
	local currentFileExtension = vim.fn.expand("%:e")

	-- Find the execution command based on the file extension
	local executionCommand = fileExtensionCommands[currentFileExtension]

	-- Check if there is a valid execution command
	if executionCommand and executionCommand ~= "" then
		-- Save changes before executing if the file is modified
		if vim.bo.modified then
			vim.cmd("write")
		end

		-- Execute the command
		vim.cmd("split | term" .. executionCommand)
		vim.cmd("startinsert")
	else
		print(
			"Error: Execution command for file type '"
			.. currentFileExtension
			.. "' not defined.\nTo define a command, update the 'fileExtensionCommands' table in your Lua configuration.\n"
		)
	end
end

-- Initialize the NetrwIsOpen variable
-- vim.g.NetrwIsOpen = 0
-- -- Function to toggle Netrw
-- function ToggleNetrw()
--     if vim.g.NetrwIsOpen == 1 then
--         local i = vim.fn.bufnr("$")
--         while i >= 1 do
--             if vim.fn.getbufvar(i, "&filetype") == "NetrwTreeListing" then
--                 vim.cmd("silent bwipeout " .. i)
--             end
--             i = i - 1
--         end
--         vim.g.NetrwIsOpen = 0
--     else
--         vim.g.NetrwIsOpen = 1
--         vim.cmd("silent Lexplore")
--     end
-- end
