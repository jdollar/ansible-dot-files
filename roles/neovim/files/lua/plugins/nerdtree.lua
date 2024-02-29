-- file explorer
return {
  'scrooloose/nerdtree',
  config = function()
    -- display one line menu because of padding bug in new version
    vim.g.NERDTreeMinimalMenu = 1
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

    vim.api.nvim_set_keymap(
      'n',
      '<C-b>',
      ':ToggleNERDTreeFind<CR>',
      { noremap = false }
    )
  end
}
