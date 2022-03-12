HOME_DIR = os.getenv('HOME')

vim.opt.filetype = 'off'
vim.opt.mouse = 'a'

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

-- cool git changes in gutter on left
Plug('airblade/vim-gitgutter')

-- enables use of .editorconfig files
Plug('editorconfig/editorconfig-vim')

-- file explorer
Plug('scrooloose/nerdtree')
-- file icons
Plug('ryanoasis/vim-devicons')

-- fuzzy file search/finder
Plug('junegunn/fzf', { dir = HOME_DIR .. '/.fzf', ['do'] = './install --all' })
Plug('junegunn/fzf.vim')


-- Abstraction layer for nvim syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
-- Module for treesitter, rainbow parans
Plug('p00f/nvim-ts-rainbow')

vim.call('plug#end')

-- Require lua modules for additional config
require('coc-conf')
require('fzf-conf')
require('nvim-treesitter-conf')
require('vim-devicons-conf')
require('nerdtree-conf')

