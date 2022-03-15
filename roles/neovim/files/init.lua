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

--vim.opt.background = 'dark'
vim.opt.laststatus = 2
vim.opt.wrap = false

vim.opt.tags = './tags;' .. HOME_DIR

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.autoindent = true

vim.cmd([[
command! PackerInstall packadd packer.nvim | lua require('plugins').install()
command! PackerUpdate packadd packer.nvim | lua require('plugins').update()
command! PackerSync packadd packer.nvim | lua require('plugins').sync()
command! PackerClean packadd packer.nvim | lua require('plugins').clean()
command! PackerStatus packadd packer.nvim | lua require('plugins').status()
command! PackerCompile packadd packer.nvim | lua require('plugins').compile()

" Refresh packer lazy-loading when plugins.lua changes:
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" Install packer.nvim, if it isn't present:
let g:install_path = stdpath('data') . '/site/pack/packer/opt/packer.nvim'
if empty(glob(g:install_path))
	call system(['git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', g:install_path])
	PackerSync
endif
]])

