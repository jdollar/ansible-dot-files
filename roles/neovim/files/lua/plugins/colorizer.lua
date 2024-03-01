-- git functionality
return {
  'NvChad/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      filetypes = {
        'css',
        'html',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'lua',
      },
    })
  end
}
