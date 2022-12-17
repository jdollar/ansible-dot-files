return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim", opt = true }

  use 'bling/vim-airline'
  use 'jeetsukumaran/vim-filebeagle'

  -- colorscheme
  use 'sainnhe/everforest'
  --
  -- git functionality
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  -- enables use of .editorconfig files
  use 'editorconfig/editorconfig-vim'

  -- file explorer
  use  'scrooloose/nerdtree'
  -- file icons
  use 'ryanoasis/vim-devicons'

  -- language server support
  use 'hrsh7th/cmp-nvim-lsp'
  use 'neovim/nvim-lspconfig'

  -- json schemas for language server
  use "b0o/schemastore.nvim"

  use {
    'williamboman/nvim-lsp-installer',
    requires = {
      'hrsh7th/cmp-nvim-lsp'
    }
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
    }
  }

  -- Displays popup for keybind help
  use 'folke/which-key.nvim'

  -- Signature argument documentation
  use 'ray-x/lsp_signature.nvim'

  -- Php linter
  use 'stephpy/vim-php-cs-fixer'

  -- fuzzy file search/finder
  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end,
  }
  use 'junegunn/fzf.vim'

  -- auto close brackets + parenthesis
  use 'windwp/nvim-autopairs'

  -- Abstraction layer for nvim syntax highlighting
  -- Adds language parsers and max syntax pretty
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  -- Module for treesitter, rainbow parans
  use 'p00f/nvim-ts-rainbow'

  -- Indent guides
  use 'lukas-reineke/indent-blankline.nvim'

  -- Facilitate generating doc blocks
  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  }

  -- Display lsp errors better
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- Undotree
  use 'mbbill/undotree'
end
)

