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
