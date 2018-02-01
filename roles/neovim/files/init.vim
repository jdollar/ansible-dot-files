filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim

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

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
"Removing solarized in favor of zenburn
"Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'flazz/vim-colorschemes'
"comment out the following line if in arch. Need to use aur setup or upstream installation
"Plugin 'valloric/youcompleteme'
Plugin 'Shougo/deoplete.nvim'
Plugin 'w0rp/ale'
Plugin 'rrrene/credo'
Plugin 'sheerun/vim-polyglot'

call vundle#end()

let g:ale_linters = {
\    'elixir': ['credo']
\}

set autoindent
syntax enable
colorscheme zenburn 

