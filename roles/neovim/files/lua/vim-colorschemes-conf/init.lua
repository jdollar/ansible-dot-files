local VimColorSchemesConf = {}

function VimColorSchemesConf.setup()
vim.cmd([[
colorscheme zenburn
hi Visual term=reverse cterm=reverse guibg=Grey
]])
end

return VimColorSchemesConf

