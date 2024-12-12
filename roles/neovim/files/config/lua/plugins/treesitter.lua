-- Folding settings
local function configure_folding()
  vim.api.nvim_create_autocmd({ "FileType" }, {
    callback = function()
      if require("nvim-treesitter.parsers").has_parser() then
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      else
        vim.opt.foldmethod = "syntax"
      end
    end,
  })
end

-- Configure textobjects
local function configure_textobjects()
  return {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "Select around a function call" },
        ["if"] = { query = "@function.inner", desc = "Select inner part of a function call" },
        ["ac"] = { query = "@class.outer", desc = "Select around a class" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["ip"] = { query = "@parameter.inner", desc = "Select inner part of a parameter region" },
      },
      selection_modes = {
        ["@parameter.outer"] = "v", 
        ["@function.outer"] = "V",
        ["@class.outer"] = "<c-v>",
      },
      include_surrounding_whitespace = true,
    },
  }
end

-- Configure incremental selection
local function configure_incremental_selection()
  return {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
  }
end

-- Treesitter configuration options
local function configure_treesitter()
  return {
    ensure_installed = {
      "bash", "c", "css", "diff", "go", "html", "javascript", "lua", "luadoc", "markdown", "python", "vim", "vimdoc",
    },
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "ruby" },
    },
    indent = {
      enable = true,
      disable = { "ruby" },
    },
    textobjects = configure_textobjects(),
    incremental_selection = configure_incremental_selection(),
  }
end

-- Configure Treesitter plugin
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  opts = configure_treesitter(),
  config = function(_, opts)
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup(opts)
  end,
  init = configure_folding,  -- Initialize folding settings
}

