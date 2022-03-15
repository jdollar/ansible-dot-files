vim.g.NERDTreeWinPos = 'right'

vim.cmd([[
function! s:toggleNERDTreeFind()
    if g:NERDTree.IsOpen()
        execute ':NERDTreeClose'
    else
      if bufname('%') == ''
          execute ':NERDTree'
      else
          execute ':NERDTreeFind'
      endif
    endif
endfunction

command! ToggleNERDTreeFind :call s:toggleNERDTreeFind()
]])

