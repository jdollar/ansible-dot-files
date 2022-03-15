local FzfConf = {}

function FzfConf.setup()
  -- Stops Rg from returning results based on file name matches
  vim.cmd([[
  let g:fzf_preview_window = ['right:60%', 'ctrl-/']
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
  command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
  ]])
end

return FzfConf

