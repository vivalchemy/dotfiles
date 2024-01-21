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

function ExecuteCurrentFile()
	-- Define a table that maps file extensions to execution commands
	local fileExtensionCommands = {
		c = "!gcc % && ./a.out",
		cpp = "!g++ % && ./a.out",
		py = "!python3 %", -- Use "python3" for Python files
		sh = "!chmod +x % && %",
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
LAZY_PLUGIN_SPEC = {}
function spec(plugin)
	table.insert(LAZY_PLUGIN_SPEC, { import = plugin })
end

-- for plugin in LAZY_PLUGIN_SPEC do
-- print(plugin)
-- end

-- print("Reached functions.lua")
