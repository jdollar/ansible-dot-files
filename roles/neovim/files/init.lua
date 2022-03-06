HOME_DIR = os.getenv('HOME')

vim.opt.filetype = 'off'

vim.api.nvim_set_keymap(
  'n',
  '<Space>',
  '<Nop>',
  { noremap = false }
)

vim.g.mapleader = ' '

vim.opt.compatible = false

-- Set hybrid line numbering
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.background = 'dark'
vim.opt.laststatus = 2
vim.opt.wrap = false

vim.opt.tags = './tags;' .. HOME_DIR

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.autoindent = true

vim.call('plug#begin', HOME_DIR .. '/.config/nvim/bundle')

local Plug = vim.fn['plug#']
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('bling/vim-airline')
Plug('jeetsukumaran/vim-filebeagle')
Plug('flazz/vim-colorschemes')
Plug('w0rp/ale')
Plug('rrrene/credo')
Plug('airblade/vim-gitgutter')
Plug('editorconfig/editorconfig-vim')
Plug('scrooloose/nerdtree')
Plug('junegunn/fzf', { dir = HOME_DIR .. '/.fzf', ['do'] = './install --all' })
Plug('junegunn/fzf.vim')

vim.call('plug#end')

-- Disabling ale lsp so coc can do it
vim.g.ale_disable_lsp = 1

