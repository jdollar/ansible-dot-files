-- Nerd Tree
vim.api.nvim_set_keymap(
  'n',
  '<C-b>',
  ':ToggleNERDTreeFind<CR>',
  { noremap = false }
)

-- fzf -- file name search
vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  ':Files<CR>',
  { noremap = false }
)

-- fzf -- file contents across dir search
vim.api.nvim_set_keymap(
  'n',
  '<Leader>f',
  ':Rg<CR>',
  { noremap = false }
)

-- fzf -- switch to another active buffer
vim.api.nvim_set_keymap(
  'n',
  '<Leader>b',
  ':Buffers<CR>',
  { noremap = false }
)

-- quickfix -- go to the next record
vim.api.nvim_set_keymap(
  'n',
  '<Leader>n',
  ':cn<CR>',
  { noremap = false }
)

-- quickfix -- go to the prev record
vim.api.nvim_set_keymap(
  'n',
  '<Leader>p',
  ':cp<CR>',
  { noremap = false }
)

-- quickfix -- open quickfix again
vim.api.nvim_set_keymap(
  'n',
  '<Leader>qo',
  ':copen<CR>',
  { noremap = false }
)

-- quickfix -- close quickfix
vim.api.nvim_set_keymap(
  'n',
  '<Leader>qc',
  ':cclose<CR>',
  { noremap = false }
)
