-- Open Undotree
vim.api.nvim_set_keymap(
  'n',
  '<Leader>U',
  ':UndotreeToggle<CR>',
  { noremap = false, desc = "Open Undotree" }
)
