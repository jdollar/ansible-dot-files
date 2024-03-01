return {
  "AckslD/nvim-neoclip.lua",
  requires = {
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require('neoclip').setup()

    vim.keymap.set('n', '<leader>fy', ":Telescope neoclip<CR>", {})
  end,
}
