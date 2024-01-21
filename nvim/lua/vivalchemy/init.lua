require "vivalchemy.core.options"
require "vivalchemy.core.keybindings"
require "vivalchemy.core.functions"

-- plugins
spec "vivalchemy.plugins.onedark" -- colorscheme 
spec "vivalchemy.plugins.telescope" -- fuzzy finder
spec "vivalchemy.plugins.none-ls" -- autocompletion 
spec "vivalchemy.plugins.nvim-lspconfig" -- lsp 
spec "vivalchemy.plugins.treesitter" -- breaking down the code to parse 
spec "vivalchemy.plugins.lualine" -- status line
spec "vivalchemy.plugins.gitsigns" -- git changes
spec "vivalchemy.plugins.indent-blankline" -- indentation
spec "vivalchemy.plugins.which-key" -- show keybindings
-- spec "vivalchemy.plugins.mason" -- added for more dumber reasons than you think
spec "vivalchemy.plugins.nvim-cmp" -- colorscheme 

-- Plugins that don't need configuring
spec "vivalchemy.plugins.vim-fugitive"
spec "vivalchemy.plugins.vim-rhubarb"
spec "vivalchemy.plugins.vim-sleuth"
spec "vivalchemy.plugins.comment"
spec 'vivalchemy.plugins.vim-be-good'

-- Loading the above plugins
require "vivalchemy.plugins.lazy"
require "vivalchemy.core.cant-understand" -- me brain small. me brain can't comprehend neovim. but me try. me conquer
