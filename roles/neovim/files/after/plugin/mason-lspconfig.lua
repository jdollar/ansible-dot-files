local lspconfig = require('lspconfig')

-- Include the servers you want to have installed by default below
local servers = {
  "ansiblels", -- Ansible
  "bashls",
  "dockerls", -- Dockerfiles
  "eslint",
  "gopls", -- Golang
  "intelephense", -- PHP
  "jsonls", -- JSON
  "pyright", -- Python
  "rust_analyzer", -- Rust
  "sumneko_lua", -- Lua
  "tflint", -- Terraform
  "tsserver", -- JS
  "vimls", -- vimscript
  "yamlls", -- yaml
}

require('mason-lspconfig').setup {
  ensure_installed = servers
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cI', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    {
      group = augroup,
      buffer = bufnr,
      callback = function() vim.lsp.buf.format() end
    }
  )
end

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      -- Setup vim as a known global so we don't get warnings in vim lua files
      diagnostics = { globals = { 'vim' } }
    }
  }
}

lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  }
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemaStore = { enable = true },
    },
  }
}

local function go_org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    vim.api.nvim_create_autocmd(
      { "BufWritePre" },
      {
        group = augroup,
        pattern = { "*.go" },
        callback = function() go_org_imports() end
      }
    )
  end,
  capabilities = capabilities,
  settings = {
    gofumpt = true,
  }
}

local default_servers = {
  "ansiblels", -- Ansible
  "bashls",
  "dockerls", -- Dockerfiles
  "eslint",
  "intelephense", -- PHP
  "pyright", -- Pythn
  "rust_analyzer", -- Rust
  "tflint", -- Terraform
  "tsserver", -- JS
  "vimls", -- vimscript
}

for _, server in ipairs(default_servers) do
  lspconfig[server].setup { on_attach = on_attach, capabilities = capabilities }
end
