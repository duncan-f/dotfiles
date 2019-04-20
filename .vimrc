"let g:tex_flavor = 'latex'
let mapleader = ','

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jreybert/vimagit'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vim-airline/vim-airline'
call plug#end()

set nocompatible
set encoding=utf-8
set number relativenumber	      " show line numbers
set clipboard=unnamed             " use the system clipboard
set wildmode=longest,list,full
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin on
syntax on

autocmd BufWritePost ~/.bashrc,~/.bash_profile !source %
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

map <C-n>   :NERDTreeToggle<cr>
map <C-g>   :Magit<cr>
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

" compiler on writing to file
map <leader>c :w! \| !compiler <c-r>%<CR>

" Luke Smith's keybindings for editing
" Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

"" tex
autocmd FileType tex nnoremap <F5> :!pdflatex<space><c-r>%<Enter>
autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i

"" html, php
autocmd FileType php,html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;i <i></i><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;u <u></u><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;em <em></em><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;p <p></p><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;div <div></div><Space><++><Esc>FbT>i

