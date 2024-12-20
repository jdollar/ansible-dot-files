-- Github copilot alternative
return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  commit = "937667b2cadc7905e6b9ba18ecf84694cf227567",
  config = function()
    require('codeium').setup({})

    -- disable codium's default bindings
    --vim.g.codeium_disable_bindings = 1

    --vim.keymap.set('i', '<M-o>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    --vim.keymap.set('i', '<M-l>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    --vim.keymap.set('i', '<M-h>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    --vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  end
}
