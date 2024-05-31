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
    c = "gcc % && ./a.out",
    cpp = "g++ % && ./a.out",
    py = "python3 %", -- Use "python3" for Python files
    go = "go run %",
    sh = "chmod +x % && %",
    rs = "cargo run",
    lua = "lua %",
    js = "bun %",
    ts = "bun %",
    dart = "dart %"
  }

  -- Get the file extension of the current file
  local currentFileExtension = vim.fn.expand("%:e")

  -- Find the execution command based on the file extension
  local executionCommand = "! " .. fileExtensionCommands[currentFileExtension]

  -- Check if there is a valid execution command
  if executionCommand and executionCommand ~= "" then
    -- Save changes before executing if the file is modified
    if vim.bo.modified then
      vim.cmd("write")
    end

    -- Execute the command
    vim.cmd("split | term" .. executionCommand)
    -- vim.cmd("FloatermNew!" .. "--disposable" .. executionCommand)
    vim.cmd("startinsert")
  else
    print(
      "Error: Execution command for file type '"
      .. currentFileExtension
      .. "' not defined.\nTo define a command, update the 'fileExtensionCommands' table in your Lua configuration.\n"
    )
  end
end

LAZY_PLUGIN_SPEC = {}
function spec(plugin)
  table.insert(LAZY_PLUGIN_SPEC, { import = plugin })
end
