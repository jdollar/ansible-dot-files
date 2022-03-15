local indentBlanklineConf = {}

function indentBlanklineConf.setup()
  local indentBlankline = require('indent_blankline')

  vim.opt.list = true

  indentBlankline.setup({
    show_current_context = true,
    show_current_context_start = true
  })
end

return indentBlanklineConf

