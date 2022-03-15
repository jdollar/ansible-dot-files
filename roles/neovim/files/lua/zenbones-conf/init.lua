local ZenbonesConf = {}

function ZenbonesConf.setup()
  vim.cmd([[
    colorscheme base16-ocean
  ]])

  -- Modified zenburn, white on 0F
  --require('base16-colorscheme').setup({
  --  base00 = '#383838', base01 = '#404040', base02 = '#606060', base03 = '#6f6f6f',
  --  base04 = '#808080', base05 = '#dcdccc', base06 = '#c0c0c0', base07 = '#ffffff',
  --  base08 = '#dca3a3', base09 = '#dfaf8f', base0A = '#e0cf9f', base0B = '#5f7f5f',
  --  base0C = '#93e0e3', base0D = '#7cb8bb', base0E = '#dc8cc3', base0F = '#ffffff'
  --})
end

return ZenbonesConf

