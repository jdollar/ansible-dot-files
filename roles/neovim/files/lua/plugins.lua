return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim", opt = true }

  use 'bling/vim-airline'
  use 'jeetsukumaran/vim-filebeagle'
  
  -- colorscheme
  use {
    'sainnhe/everforest',
    config = function() require('zenbones-conf') end
  }
  --use {
  --  'RRethy/nvim-base16',
  --  config = function() require('zenbones-conf').setup() end
  --}
  
  -- git functionality
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('gitsigns').setup() end
  }
  
  -- enables use of .editorconfig files
  use 'editorconfig/editorconfig-vim'
  
  -- file explorer
  use {
    'scrooloose/nerdtree',
    config = function() require('nerdtree-conf') end
  }
  -- file icons
  use {
    'ryanoasis/vim-devicons',
    config = function() require('vim-devicons-conf') end
  }
  
  -- language server support
  use 'hrsh7th/cmp-nvim-lsp'
  use 'neovim/nvim-lspconfig'
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      require('nvim-lsp-installer-conf')
    end,
    requires = {
      'hrsh7th/cmp-nvim-lsp'
    }
  }
  
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('nvim-cmp-conf')
    end,
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
    }
  }

  -- Signature argument documentation
  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp-signature-conf')
    end
  }

  -- fuzzy file search/finder
  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end,
    config = function() require('fzf-conf') end
  }
  use 'junegunn/fzf.vim'

  -- auto close brackets + parenthesis
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs-conf') end
  }

  -- Abstraction layer for nvim syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('nvim-treesitter-conf') end
  }
  -- Module for treesitter, rainbow parans
  use 'p00f/nvim-ts-rainbow'

  -- Indent guides
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('indent-blankline-conf') end
  }
end)

