-- language server support
return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    { 'mason.nvim', opts = {} },
    "neovim/nvim-lspconfig",
    'hrsh7th/cmp-nvim-lsp',
    -- Signature argument documentation
    'ray-x/lsp_signature.nvim',
    'towolf/vim-helm', -- helm-ls support
  },
  config = function()
    -- Include the servers you want to have installed by default below
    local servers = {
      -- Ansible
      ansiblels = {},
      -- Bash
      bashls = {},
      -- Dockerfiles
      dockerls = {},
      -- C/C++
      clangd = {},
      -- eslint
      eslint = {},
      -- Golang
      --golangci_lint_ls = {
      --  root_markers = {
      --    '.golangci.yml',
      --    '.golangci.yaml',
      --    '.golangci-lint.yaml',
      --    '.golangci-lint.yml',
      --    'go.mod',
      --  },
      --  init_options = {
      --    command = { "golangci-lint", "run", "--output.json.path", "stdout", "--show-stats=false", "--issues-exit-code=1" }
      --  }
      --},
      gopls = {
        settings = {
          ['gopls'] = {
            buildFlags = { "-tags=testing,awsmock,generator,integration,benchmark" },
            gofumpt = true,
          }
        }
      },
      -- Grammer
      harper_ls = {},
      -- Latex
      ltex = {},
      texlab = {},
      -- Helm
      helm_ls = {},
      -- PHP
      intelephense = {},
      -- JSON
      jsonls = {
        settings = {
          ['json'] = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        }
      },
      -- Java
      jdtls = {},
      -- Python
      pyright = {
        settings = {
          ['pyright'] = {
            venvPath = ".",
            venv = ".venv"
          }
        }
      },
      -- Rust
      rust_analyzer = {},
      -- Lua
      lua_ls = {
        settings = {
          ['Lua'] = {
            -- Setup vim as a known global so we don't get warnings in vim lua files
            diagnostics = { globals = { 'vim' } }
          }
        }
      },
      -- Terraform
      tflint = {},
      -- Javascript
      ts_ls = {},
      -- Vimscript
      vimls = {},
      -- yaml
      yamlls = {
        settings = {
          ['yaml'] = {
            schemaStore = { enable = false, url = "" },
            validate = { enable = true },
          },
        }
      },
    }

    local server_keys = {}
    for k, _ in pairs(servers) do
      if k ~= 'vimls' then
        table.insert(server_keys, k)
      end
    end

    require("mason-lspconfig").setup {
      ensure_installed       = server_keys,
      automatic_installation = true,
    }

    local lsp_signature = require("lsp_signature")

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
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cI', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        if client.name == 'yamlls' then
          -- Disable yamlls processing for helm files
          if vim.bo[ev.buf].buftype ~= "" or vim.bo[ev.buf].filetype == "helm" then
            vim.diagnostic.disable()
          end
        end

        if client.name == "ts_ls" then
          client.server_capabilities.documentFormattingProvider = false
        end

        if client.name == "intelephense" then
          client.server_capabilities.documentFormattingProvider = false
        end

        if client.name == "eslint" then
          client.server_capabilities.documentFormattingProvider = false

          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = ev.buf,
            command = "EslintFixAll",
          })
        end

        if not client.name == "clangd" then
          if not client:supports_method('textDocument/willSaveWaitUntil') and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = ev.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end

        if client.name == "gopls" then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = ev.buf,
            callback = function()
              local original = vim.notify
              vim.notify = function(msg, level, opts)
                if msg == 'No code actions available' then
                  return
                end

                original(msg, level, opts)
              end

              vim.lsp.buf.format()
              vim.lsp.buf.code_action { context = { only = { 'source.organizeImports' } }, apply = true }
              vim.lsp.buf.code_action { context = { only = { 'source.fixAll' } }, apply = true }
            end,
          })
        end


        on_attach(client, ev.buf)
      end,
    })

    for server, config in pairs(servers) do
      if server == "jdtls" then
        goto continue
      end

      config.capabilities = capabilities

      vim.lsp.config(server, config)
      ::continue::
    end
  end
}
