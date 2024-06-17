return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
  config = function()
    -- Clear current suggestion     codeium#Clear()              <C-x>
    -- Next suggestion              codeium#CycleCompletions(1)  <M-n>
    -- Previous suggestion          codeium#CycleCompletions(-1) <M-p>
    -- Insert suggestion            codeium#Accept()             <M-Enter>
    -- Manually trigger suggestion  codeium#Complete()           <M-Bslash>
    vim.keymap.set('i', '<M-CR>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<M-n>', function() return vim.fn['codeium#CycleCompletions'](1) end,
      { expr = true, silent = true })
    vim.keymap.set('i', '<M-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
      { expr = true, silent = true })
    vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<M-\\>', function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true })
    --
    --
    -- For some reason of the terminal alt with another key will trigger escape key and that other key so can't map to alt
  end
}
