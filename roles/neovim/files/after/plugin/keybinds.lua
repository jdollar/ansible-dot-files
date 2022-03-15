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

