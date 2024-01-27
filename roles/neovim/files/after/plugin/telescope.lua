local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fp', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})

-- lsp
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions, {})

require('telescope').setup {}
-- require('telescope').load_extension('fzf')
