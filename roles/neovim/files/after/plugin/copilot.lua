-- copilot keybinds
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.keymap.set('i', '<M-o>', function() return vim.fn['copilot#Accept']("<CR>") end,
--   { noremap = true, silent = true, expr = true, replace_keycodes = false })
-- vim.keymap.set('i', '<M-l>', '<Plug>(copilot-next)', {})
-- vim.keymap.set('i', '<M-h>', '<Plug>(copilot-previous)', {})
-- vim.keymap.set('i', '<M-x>', '<Plug>(copilot-suggest)', {})

vim.keymap.set('i', '<M-o>', function() return vim.fn['codeium#Accept']() end, { expr = true })
vim.keymap.set('i', '<M-l>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
vim.keymap.set('i', '<M-h>', function() return vim.fn['codeium#CycleCompletions']( -1) end, { expr = true })
vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
