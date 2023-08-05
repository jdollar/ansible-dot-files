vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.keymap.set('i', '<C-g>', function() return vim.fn['copilot#Accept']("<CR>") end,
  { noremap = true, silent = true, expr = true, replace_keycodes = false })
vim.keymap.set('i', '<M-.>', '<Plug>(copilot-next)', {})
vim.keymap.set('i', '<M-,>', '<Plug>(copilot-previous)', {})
vim.keymap.set('i', '<C-x>', '<Plug>(copilot-suggest)', {})
