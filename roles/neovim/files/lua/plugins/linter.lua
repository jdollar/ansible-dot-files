-- linter support outside lsp
return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup({
      methos = {
        formatting = false,
      },
      sources = {
        null_ls.builtins.formatting.phpcsfixer,
        -- null_ls.builtins.code_actions.eslint, says to use eslint_language_server
        -- null_ls.builtins.diagnostics.shellcheck, says to use bashls
        null_ls.builtins.formatting.prettierd,
      },
    })

    require('mason-null-ls').setup({
      ensure_installed = nil,
      automatic_installation = true,
      automatic_setup = true,
    })
  end,
}
