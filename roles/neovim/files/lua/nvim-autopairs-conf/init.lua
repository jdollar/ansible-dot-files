local NvimAutopairsConf = {}

function NvimAutopairsConf.setup()
  local autopairs = require("nvim-autopairs")

  autopairs.setup({
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
  })
end

return NvimAutopairsConf
