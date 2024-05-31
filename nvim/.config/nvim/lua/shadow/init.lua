-- core utilities
require("shadow.core.options")
require("shadow.core.functions")
require("shadow.core.keybindings")

-- plugins
-- spec("shadow.plugins.catppuccin")      -- color theme
spec("shadow.plugins.codeium")         -- ai completions
spec("shadow.plugins.comment")         -- comment the selected text
spec("shadow.plugins.conform")         -- formatter
spec("shadow.plugins.git_signs")       -- git signs column
-- spec("shadow.plugins.indent_blankline") -- indent line
spec("shadow.plugins.mini")            -- mini plugins
spec("shadow.plugins.nvim_cmp")        -- completions
-- spec("shadow.plugins.nvim_dap") -- debugger
spec("shadow.plugins.nvim_lint")       -- linter
spec("shadow.plugins.nvim_lsp_config") -- lsp
spec("shadow.plugins.onedark")         -- color theme
spec("shadow.plugins.obsidian")        -- obsidian
spec("shadow.plugins.telescope")       -- fuzzy finder
spec("shadow.plugins.todo_comments")   -- todo comments
spec("shadow.plugins.treesitter")      -- syntax highlighting
spec("shadow.plugins.undotree")        -- undo history
spec("shadow.plugins.vim_floaterm")    -- terminal
spec("shadow.plugins.which_key")       -- which key

spec("shadow.plugins.tmp")             -- temporary plugins

-- calling lazy after all the plugin config is loaded
require("shadow.plugins.lazy")
