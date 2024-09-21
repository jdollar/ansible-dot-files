return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup {
        size = function(term)
          if term.direction == "horizontal" then
            return 20
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
      }

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit  = Terminal:new(
        {
          cmd = "lazygit",
          dir = "git_dir",
          direction = "float",
          float_opts = {
            border = "double",
          },
          -- function to run on opening the terminal
          on_open = function(term)
            vim.cmd("startinsert!")
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
          end,
          -- function to run on closing the terminal
          on_close = function(_term)
            vim.cmd("startinsert!")
          end,
        })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

      local k9s = Terminal:new({
        cmd = "k9s",
        direction = "float",
        float_opts = {
          border = "double",
        },
        close_on_exit = true,
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })

      function _k9s_toggle()
        k9s:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>9", "<cmd>lua _k9s_toggle()<CR>", { noremap = true, silent = true })
    end
  }
}
