-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

-- function ExecuteCurrentFile()
-- 	-- Define a table that maps file extensions to execution commands
-- 	local fileExtensionCommands = {
-- 		c = "gcc % && ./a.out",
-- 		cpp = "g++ % && ./a.out",
-- 		py = "python3 %", -- Use "python3" for Python files
-- 		go = "go run %",
-- 		sh = "chmod +x % && ./%",
-- 		rs = "cargo run",
-- 		lua = "lua %",
-- 		js = "bun %",
-- 		ts = "bun %",
-- 		dart = "dart %",
-- 	}
--
-- 	-- Get the file extension of the current file
-- 	local currentFileExtension = vim.fn.expand("%:e")
--
-- 	-- Find the execution command based on the file extension
-- 	local executionCommand = "! " .. fileExtensionCommands[currentFileExtension]
--
-- 	-- Check if there is a valid execution command
-- 	if executionCommand and executionCommand ~= "" then
-- 		-- Save changes before executing if the file is modified
-- 		if vim.bo.modified then
-- 			vim.cmd("write")
-- 		end
--
-- 		-- Execute the command
-- 		vim.cmd("split | term" .. executionCommand)
-- 		-- vim.cmd("FloatermNew!" .. "--disposable" .. executionCommand)
-- 		vim.cmd("startinsert")
-- 	else
-- 		print(
-- 			"Error: Execution command for file type '"
-- 				.. currentFileExtension
-- 				.. "' not defined.\nTo define a command, update the 'fileExtensionCommands' table in your Lua configuration.\n"
-- 		)
-- 	end
-- end

LAZY_PLUGIN_SPEC = {}
function Plug(plugin)
	table.insert(LAZY_PLUGIN_SPEC, { import = plugin })
end

-- set the options for neovim
function SetOptions(options, mode)
	for key, value in pairs(options) do
		vim[mode][key] = value
	end
end

-- Set the project root as the working directory
local project_root = vim.fn.getcwd() -- Store the initial CWD

-- Global variable to store the server job ID
_G.server_job_id = nil

-- Command to start the server with a fixed CWD
vim.api.nvim_create_user_command("StartServer", function()
	if _G.server_job_id == nil then
		-- Start the server in the project root directory
		_G.server_job_id = vim.fn.jobstart("local-hosting", { cwd = project_root, detach = true })
		if _G.server_job_id > 0 then
			print("Server started with job ID:", _G.server_job_id)
		else
			print("Failed to start server")
			_G.server_job_id = nil
		end
	else
		print("Server is already running with job ID:", _G.server_job_id)
	end
end, {})

-- Command to stop the server
vim.api.nvim_create_user_command("StopServer", function()
	if _G.server_job_id then
		-- Terminate the server process
		vim.fn.jobstop(_G.server_job_id)
		print("Server stopped with job ID:", _G.server_job_id)
		_G.server_job_id = nil
	else
		print("Server is not running")
	end
end, {})

-- Optional: Command to restart the server
vim.api.nvim_create_user_command("RestartServer", function()
	vim.cmd("StopServer")
	vim.cmd("StartServer")
end, {})

-- Toggle auto completion
local autoCompletionEnabled = true

function EnableAutoCompletion()
	vim.cmd("FormatEnable") -- conform

	-- Check if `cmp` is available and properly structured
	vim.b.completion = true
	require("blink.cmp").show()

	vim.cmd("SupermavenStart") -- supermaven
	autoCompletionEnabled = true
	print("Auto-completion enabled")
end

function DisableAutoCompletion()
	vim.cmd("FormatDisable") -- conform

	-- Check if `cmp` is available and properly structured
	vim.b.completion = false
	require("blink.cmp").hide()

	vim.cmd("SupermavenStop") -- supermaven
	autoCompletionEnabled = false
	print("Auto-completion disabled")
end

function ToggleAutoCompletion()
	if autoCompletionEnabled then
		DisableAutoCompletion()
	else
		EnableAutoCompletion()
	end
end

vim.api.nvim_create_user_command("EnableAutoCompletion", EnableAutoCompletion, {})
vim.api.nvim_create_user_command("DisableAutoCompletion", DisableAutoCompletion, {})
vim.api.nvim_create_user_command("ToggleAutoCompletion", ToggleAutoCompletion, {})

-- Detect file type for ansible files
if vim.filetype then
	vim.filetype.add({
		pattern = {
			[".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
			[".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
			[".*/group_vars/.*/.*%.ya?ml"] = "yaml.ansible",
			[".*/playbook.*%.ya?ml"] = "yaml.ansible",
			[".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
			[".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
			[".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
			[".*/tasks/.*%.ya?ml"] = "yaml.ansible",
			[".*/molecule/.*%.ya?ml"] = "yaml.ansible",
		},
	})
else
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = {
			"*/host_vars/*.yml",
			"*/host_vars/*.yaml",
			"*/group_vars/*.yml",
			"*/group_vars/*.yaml",
			"*/group_vars/*/*.yml",
			"*/group_vars/*/*.yaml",
			"*/playbook*.yml",
			"*/playbook*.yaml",
			"*/playbooks/*.yml",
			"*/playbooks/*.yaml",
			"*/roles/*/tasks/*.yml",
			"*/roles/*/tasks/*.yaml",
			"*/roles/*/handlers/*.yml",
			"*/roles/*/handlers/*.yaml",
			"*/tasks/*.yml",
			"*/tasks/*.yaml",
			"*/molecule/*.yml",
			"*/molecule/*.yaml",
		},
		callback = function()
			vim.bo.filetype = "yaml.ansible"
		end,
	})
end
