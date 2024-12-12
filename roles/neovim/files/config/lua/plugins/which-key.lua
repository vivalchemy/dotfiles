  return { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      enable = vim.g.have_nerd_font,
    },
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      preset = "modern",
      spec = {
        { '<leader>c', group = '[C]ode'},
        { '<leader>d', group = '[D]ebug' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>f', group = '[F]ind' },
        { '<leader>s', group = '[S]urround' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>l', group = '[L]azy' },
      },
    },
  }
