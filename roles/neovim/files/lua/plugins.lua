local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

--vim.cmd [[packadd packer.nvim]]

--vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--  augroup end
--]])

return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim" }

  use 'bling/vim-airline'
  use 'jeetsukumaran/vim-filebeagle'
  use {
    'flazz/vim-colorschemes',
    config = function() require('vim-colorschemes-conf').setup() end
  }

  -- cool git changes in gutter on left
  use 'airblade/vim-gitgutter'

  -- enables use of .editorconfig files
  use 'editorconfig/editorconfig-vim'

  -- file explorer
  use {
    'scrooloose/nerdtree',
    config = function() require('nerdtree-conf').setup() end
  }
  -- file icons
  use {
    'ryanoasis/vim-devicons',
    config = function() require('vim-devicons-conf').setup() end
  }

  -- language server support
  use {
    'williamboman/nvim-lsp-installer',
    config = function() require('nvim-lsp-installer-conf').setup() end,
    requires = {{'neovim/nvim-lspconfig'}}
  }

  -- fuzzy file search/finder
  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end,
    config = function() require('fzf-conf').setup() end
  }
  use 'junegunn/fzf.vim'


  -- Abstraction layer for nvim syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('nvim-treesitter-conf').setup() end
  }
  -- Module for treesitter, rainbow parans
  use 'p00f/nvim-ts-rainbow'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

