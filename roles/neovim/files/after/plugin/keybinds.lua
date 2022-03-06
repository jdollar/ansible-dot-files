-- Nerd Tree
vim.api.nvim_set_keymap(
  'n',
  '<C-b>',
  ':NERDTreeToggle<CR>',
  { noremap = false }
)

-- fzf
vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  ':FZF<CR>',
  { noremap = false }
)

vim.api.nvim_set_keymap(
  'n',
  '<Leader>f',
  ':Rg<CR>',
  { noremap = false }
)

