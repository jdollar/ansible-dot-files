require("lazy").setup({
  {
    "wbthomason/packer.nvim",
    lazy = true
  },

  -- allows reopening files with sudo
  -- or writing files with sudo
  'lambdalisue/suda.vim',

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
  },

  -- colorscheme
  'sainnhe/everforest',

  -- git functionality
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },

  -- enables use of .editorconfig files
  'editorconfig/editorconfig-vim',

  -- file explorer
  'scrooloose/nerdtree',
  -- file icons
  'ryanoasis/vim-devicons',

  -- language server support
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',

  -- needed for helm ls support
  'towolf/vim-helm',

  -- Linter support
  'jose-elias-alvarez/null-ls.nvim',
  'jayp0521/mason-null-ls.nvim',

  -- json schemas for language server
  'b0o/schemastore.nvim',

  -- Snippet functionality
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp'
    }
  },

  -- Displays popup for keybind help
  'folke/which-key.nvim',

  -- Signature argument documentation
  'ray-x/lsp_signature.nvim',

  -- fuzzy file search/finder
  -- use {
  --   'junegunn/fzf',
  --   run = function() vim.fn['fzf#install']() end,
  -- }
  -- use 'junegunn/fzf.vim'

  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.5',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  -- use fzf for sorting telescope
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- auto close brackets + parenthesis
  'windwp/nvim-autopairs',

  -- Abstraction layer for nvim syntax highlighting
  -- Adds language parsers and max syntax pretty
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- rainbow delimiters
  'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git',

  -- Indent guides
  'lukas-reineke/indent-blankline.nvim',

  -- Facilitate generating doc blocks
  {
    'kkoomen/vim-doge',
    build = ':call doge#install()'
  },

  -- Display lsp errors better
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },

  -- Undotree
  'mbbill/undotree',

  -- swagger previewer
  {
    "vinnymeller/swagger-preview.nvim",
    build = "npm install -g swagger-ui-watcher",
  },

  -- Github copilot alternative
  'Exafunction/codeium.vim',
})
