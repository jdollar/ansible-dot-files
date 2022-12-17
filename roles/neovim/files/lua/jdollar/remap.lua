vim.g.mapleader = ' '

vim.api.nvim_set_keymap(
  'n',
  '<Space>',
  '<Nop>',
  { noremap = false }
)

-- quickfix -- go to the next record
vim.api.nvim_set_keymap(
  'n',
  '<Leader>n',
  ':cn<CR>',
  { noremap = false, desc = "Quickfix - Next record" }
)

-- quickfix -- go to the prev record
vim.api.nvim_set_keymap(
  'n',
  '<Leader>p',
  ':cp<CR>',
  { noremap = false, desc = "Quickfix - Previous record" }
)

-- quickfix -- open quickfix again
vim.api.nvim_set_keymap(
  'n',
  '<Leader>qo',
  ':copen<CR>',
  { noremap = false, desc = "Quickfix - Open" }
)

-- quickfix -- close quickfix
vim.api.nvim_set_keymap(
  'n',
  '<Leader>qc',
  ':cclose<CR>',
  { noremap = false, desc = "Quickfix - Close" }
)
