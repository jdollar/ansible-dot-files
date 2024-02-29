return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = false },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_b = {}
      }
    }
  end
}
