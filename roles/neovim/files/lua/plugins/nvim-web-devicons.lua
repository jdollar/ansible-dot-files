-- cool icons on file explorers
return {
  'kyazdani42/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup({
      default = true,
    })

    vim.g.webdevicons_conceal_nerdtree_brackets = 1
  end
}
