require('mason').setup()

local lspconfig = require('lspconfig')
local lsp_signature = require("lsp_signature")

-- Include the servers you want to have installed by default below
local servers = {
  -- Ansible
  ansiblels = {},
  -- Bash
  bashls = {},
  -- Dockerfiles
  dockerls = {},
  -- Golang
  gopls = {},
  -- PHP
  intelephense = {},
  -- JSON
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    }
  },
  -- Python
  pyright = {},
  -- Rust
  rust_analyzer = {},
  -- Lua
  lua_ls = {
    settings = {
      Lua = {
        -- Setup vim as a known global so we don't get warnings in vim lua files
        diagnostics = { globals = { 'vim' } }
      }
    }
  },
  -- Terraform
  tflint = {},
  -- Javascript
  tsserver = {},
  -- Vimscript
  vimls = {},
  -- yaml
  yamlls = {
    settings = {
      yaml = {
        schemaStore = { enable = true },
      },
    }
  },
}

local server_keys = {}
for k, _ in pairs(servers) do
  table.insert(server_keys, k)
end

require('mason-lspconfig').setup {
  ensure_installed = server_keys
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
  -- Gives more informative signature help when typing
  lsp_signature.on_attach({}, bufnr)

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

  -- Setup formatting on save
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

for server, config in pairs(servers) do
  local server_config = {
    on_attach = on_attach,
    capabilities = capabilities
  }

  for k, v in pairs(config) do
    server_config[k] = v
  end

  lspconfig[server].setup(server_config)
end
