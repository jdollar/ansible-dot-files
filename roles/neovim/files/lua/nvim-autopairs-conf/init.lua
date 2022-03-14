local NvimAutopairsConf = {}

function NvimAutopairsConf.setup()
  local autopairs = require("nvim-autopairs")
  autopairs.setup()
end

return NvimAutopairsConf
