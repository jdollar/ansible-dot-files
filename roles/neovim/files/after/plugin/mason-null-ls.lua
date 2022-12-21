local null_ls = require 'null-ls'
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.phpcsfixer
  }
})

require('mason-null-ls').setup({
  ensure_installed = nil,
  automatic_installation = true,
  automatic_setup = true,
})

require('mason-null-ls').setup_handlers()
