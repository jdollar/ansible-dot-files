--return {
--  'tzachar/cmp-ai',
--  enabled = false,
--  dependencies = { 'nvim-lua/plenary.nvim' },
--  config = function()
--    local cmp_ai = require('cmp_ai.config')
--
--    cmp_ai:setup({
--      max_lines = 100,
--      provider = 'Ollama',
--      provider_options = {
--        base_url = 'http://ollama.joeldollarhide.com:11434/api/generate',
--        model = 'codellama:7b-code',
--        auto_unload = false, -- Set to true to automatically unload the model when
--        -- exiting nvim.
--      },
--      notify = true,
--      notify_callback = function(msg)
--        vim.notify(msg)
--      end,
--      run_on_every_keystroke = true
--    })
--  end
--}
-- Github copilot alternative
return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  commit = "937667b2cadc7905e6b9ba18ecf84694cf227567",
  config = function()
    require('codeium').setup({})

    -- disable codium's default bindings
    --vim.g.codeium_disable_bindings = 1

    --vim.keymap.set('i', '<M-o>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    --vim.keymap.set('i', '<M-l>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    --vim.keymap.set('i', '<M-h>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    --vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  end
}
