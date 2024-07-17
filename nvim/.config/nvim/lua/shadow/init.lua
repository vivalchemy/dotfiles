-- core utilities
require("shadow.core.utils")
require("shadow.core.options")
require("shadow.core.keybindings")

-- plugins
-- Plug("shadow.plugins.catppuccin")      -- color theme
Plug("shadow.plugins.codeium") -- ai completions
Plug("shadow.plugins.conform") -- formatter
Plug("shadow.plugins.dressing") -- improve nvim ui
Plug("shadow.plugins.flash") -- improved navigation
Plug("shadow.plugins.git_signs") -- git signs column
Plug("shadow.plugins.harpoon") -- for better multi file navigation
Plug("shadow.plugins.lazygit") -- lazygit ui in neovim
Plug("shadow.plugins.mini") -- mini plugins
Plug("shadow.plugins.noice") -- better nvim command mode ui
Plug("shadow.plugins.nvim_cmp") -- completions
-- Plug("shadow.plugins.nvim_dap") -- debugger
Plug("shadow.plugins.nvim_lint") -- linter
Plug("shadow.plugins.nvim_lsp_config") -- lsp
Plug("shadow.plugins.nvim_notify") -- notification
Plug("shadow.plugins.onedark") -- color theme
Plug("shadow.plugins.obsidian") -- obsidian
Plug("shadow.plugins.telescope") -- fuzzy finder
Plug("shadow.plugins.todo_comments") -- todo comments
Plug("shadow.plugins.treesitter") -- syntax highlighting
Plug("shadow.plugins.undotree") -- undo history
Plug("shadow.plugins.vim_tmux_navigator") -- tmux
Plug("shadow.plugins.which_key") -- which key

Plug("shadow.plugins.tmp") -- temporary plugins

-- calling lazy after all the plugin config is loaded
require("shadow.plugins.lazy")
