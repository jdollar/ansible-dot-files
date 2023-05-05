local null_ls = require 'null-ls'

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.phpcsfixer,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.code_actions.eslint,
  }
})

require('mason-null-ls').setup({
  ensure_installed = nil,
  automatic_installation = true,
  automatic_setup = true,
})

