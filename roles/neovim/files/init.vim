filetype off

set rtp+=$HOME/.config/nvim/bundle/Vundle.vim

set nocompatible
set number
"set term=xterm-256color
set background=dark
set laststatus=2
set nowrap

set tags=./tags;$HOME

set expandtab
set tabstop=2
set shiftwidth=2

set autoindent
syntax enable
call plug#begin('$HOME/.config/nvim/bundle')

Plug 'bling/vim-airline'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'flazz/vim-colorschemes'
Plug 'Shougo/deoplete.nvim'
Plug 'w0rp/ale'
Plug 'rrrene/credo'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

map <C-b> :NERDTreeToggle<CR>
