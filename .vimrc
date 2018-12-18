let g:tex_flavor = 'latex'

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jreybert/vimagit'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vim-airline/vim-airline'
call plug#end()

set nocompatible
set encoding=utf-8
set mouse=a
set number relativenumber	      " show line numbers
set scrolloff=2                   " minimum lines above/below cursor
set clipboard=unnamed             " use the system clipboard
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin on
syntax on

map <C-n>   :NERDTreeToggle<cr>
map <F10>   :PlugInstall<cr>
map <F11>   :PlugUpdate<cr>
map <F12>   :PlugClean<cr>

" map keys for Copy/Pasting
vnoremap    <C-c> "+y
vnoremap    <C-x> "+d
map         <C-v> "+P

" map navigation keys
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

