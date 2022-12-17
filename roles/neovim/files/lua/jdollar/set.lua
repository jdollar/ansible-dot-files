  HOME_DIR = os.getenv('HOME')

  vim.opt.filetype = 'off'
  vim.opt.mouse = 'a'

  vim.opt.compatible = false

  -- Set hybrid line numbering
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.nu = true
  vim.opt.rnu = true

  --vim.opt.background = 'dark'
  vim.opt.laststatus = 2
  vim.opt.wrap = false

  vim.opt.tags = './tags;' .. HOME_DIR

  vim.opt.expandtab = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2

  vim.opt.autoindent = true
