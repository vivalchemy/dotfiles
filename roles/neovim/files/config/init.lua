-- core utilities
require("core.utils")
require("core.options")
require("core.keymaps")

Plug("plugins.d2")
Plug("plugins.database")
Plug("plugins.executor")
Plug("plugins.flash")
Plug("plugins.git_signs")
Plug("plugins.harpoon")
Plug("plugins.mason")
Plug("plugins.mini")
Plug("plugins.noice")
Plug("plugins.onedarkpro")
Plug("plugins.render_markdown")
Plug("plugins.snacks")
Plug("plugins.telescope")
Plug("plugins.tmp")
Plug("plugins.todo_comments")
Plug("plugins.treesitter")
Plug("plugins.undotree")
Plug("plugins.vim_tmux_navigator")
Plug("plugins.which-key")
Plug("plugins.yazi")

-- Completion plugins
Plug("plugins.conform") -- FormatDisable / FormatEnable
Plug("plugins.nvim_cmp") -- :lua require("cmp").setup { enabled = false/true }
-- Plug("plugins.blink-cmp")
Plug("plugins.nvim_lint")
Plug("plugins.nvim_lspconfig") -- LspStart/ LspStop
Plug("plugins.supermaven") -- SupermavenStart / SupermavenStop

require("plugins.lazy")
