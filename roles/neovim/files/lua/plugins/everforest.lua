-- colorscheme
return {
  'sainnhe/everforest',
  config = function()
    vim.o.termguicolors = true
    vim.o.background = "dark"
    vim.g.everforest_background = "soft"
    vim.g.everforest_enable_italic = 1

    vim.cmd.colorscheme('everforest')
  end
}
