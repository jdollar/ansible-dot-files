local NvimLspInstallerConf = {}

function NvimLspInstallerConf.setup()

  local lsp_installer = require "nvim-lsp-installer"

  -- Include the servers you want to have installed by default below
  local servers = {
    "ansiblels", -- Ansible
    "bashls",
    "dockerls", -- Dockerfiles
    "eslint",
    "gopls", -- Golang
    "jsonls", -- JSON
    "pyright", -- Pythn
    "rust_analyzer", -- Rust
    "sumneko_lua", -- Lua
    "tflint", -- Terraform
    "tsserver", -- JS
    "vimls", -- vimscript
    "yamlls", -- yaml
  }

  for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
  -- or if the server is already installed).
  lsp_installer.on_server_ready(function(server)
      local opts = {
        capabilities = capabilities
      }

      if server.name == 'sumneko_lua' then
        opts.settings = {
          Lua = {
            diagnostics = { globals = {  'vim' } }
          }
        }
      end

      -- (optional) Customize the options passed to the server
      -- if server.name == "tsserver" then
      --     opts.root_dir = function() ... end
      -- end

      -- This setup() function will take the provided server configuration and decorate it with the necessary properties
      -- before passing it onwards to lspconfig.
      -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      server:setup(opts)
  end)
end

return NvimLspInstallerConf