return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add indentation guides even on blank lines
    require('mini.indentscope').setup({
      draw = {
        -- Delay (in ms) between event and start of drawing
        delay = 0,
        animation = require('mini.indentscope').gen_animation.none()
      }
    })

    -- File explorer
    require("mini.files").setup()

    --     local starter = require("mini.starter")
    --     starter.setup({
    --       content_hooks = {
    --         starter.gen_hook.adding_bullet(""),
    --         starter.gen_hook.aligning("center", "center"),
    --       },
    --       evaluate_single = true,
    --       footer = os.date(),
    --       header = table.concat({
    --         [[  █████╗ ██████╗  ██████╗██╗  ██╗      ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ]],
    --         [[ ██╔══██╗██╔══██╗██╔════╝██║  ██║      ████╗  ██║██║   ██║██║████╗ ████║ ]],
    --         [[ ███████║██████╔╝██║     ███████║█████╗██╔██╗ ██║██║   ██║██║██╔████╔██║ ]],
    --         [[ ██╔══██║██╔══██╗██║     ██╔══██║╚════╝██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
    --         [[ ██║  ██║██║  ██║╚██████╗██║  ██║      ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
    --         [[ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝      ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
    --       }, "\n"),
    --       query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
    --       items = {
    --         { name = "G]it Lazygit",     action = "FloatermNew lazygit",                 section = "Git" },
    --         { name = "U]pdate Plugins",  action = "Lazy update",                         section = "Plugins" },
    --         { name = "F]ind file",       action = "Telescope find_files",                section = "Telescope" },
    --         { name = "R]ecent files",    action = "Telescope oldfiles",                  section = "Telescope" },
    --         { name = "Gr]ep text",       action = "Telescope live_grep",                 section = "Telescope" },
    --         { name = "C]onfig",          action = "Telescope fd cwd=$HOME/.config/nvim", section = "Config" },
    --         { name = "L]azy",            action = "Lazy",                                section = "Config" },
    --         { name = "M]ason",           action = "Mason",                               section = "Config" },
    --         { name = "Q]uit",            action = "qa!",                                 section = "Built-in" },
    --         { name = "S]ession restore", action = [[lua require("persistence").load()]], section = "Session" }
    --       },
    --     })
    --
    --     vim.cmd([[
    --   augroup MiniStarterJK
    --     au!
    --     au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
    --     au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
    --     au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>Telescope find_files<CR>
    --     au User MiniStarterOpened nmap <buffer> <C-n> <Cmd>Telescope file_browser<CR>
    --   augroup END
    -- ]])
    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup(
      {
        mappings = {
          add = '<leader>s',             -- Add surrounding in Normal and Visual modes
          delete = '<leader>sd',         -- Delete surrounding
          find = '<leader>sf',           -- Find surrounding (to the right)
          find_left = '<leader>sF',      -- Find surrounding (to the left)
          highlight = '<leader>sh',      -- Highlight surrounding
          replace = '<leader>sr',        -- Replace surrounding
          update_n_lines = '<leader>sn', -- Update `n_lines`

          suffix_last = 'l',             -- Suffix to search with "prev" method
          suffix_next = 'n',             -- Suffix to search with "next" method
        },
      }
    )
    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
