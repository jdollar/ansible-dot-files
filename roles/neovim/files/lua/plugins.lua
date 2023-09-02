return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim", opt = true }

  -- allows reopening files with sudo
  -- or writing files with sudo
  use 'lambdalisue/suda.vim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- colorscheme
  use 'sainnhe/everforest'

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
  use 'scrooloose/nerdtree'
  -- file icons
  use 'ryanoasis/vim-devicons'

  -- language server support
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'

  -- needed for helm ls support
  use 'towolf/vim-helm'

  -- Linter support
  use "jose-elias-alvarez/null-ls.nvim"
  use "jayp0521/mason-null-ls.nvim"

  -- json schemas for language server
  use "b0o/schemastore.nvim"

  -- Snippet functionality
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp'
    }
  }

  -- Displays popup for keybind help
  use 'folke/which-key.nvim'

  -- Signature argument documentation
  use 'ray-x/lsp_signature.nvim'

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

  -- swagger previewer
  use {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
  }

  -- Github copilot alternative
  use 'Exafunction/codeium.vim'
end
)
