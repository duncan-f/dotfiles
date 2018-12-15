" Vundle Setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jreybert/vimagit'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'PotatoesMaster/i3-vim-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

set encoding=utf-8
set mouse=a
syntax on

set ruler                         " show row and column in footer
set number relativenumber	      " show line numbers
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set clipboard=unnamed             " use the system clipboard
set hlsearch                      " highlight all search matches
set tabstop=4
set shiftwidth=4
set expandtab

let g:livepreview_previewer = 'mupdf'
let g:livepreview_engine = 'pdflatex'
let g:livepreview_cursorhold_recompile = 0
let g:tex_flavor = 'latex'

map <F8>    :NERDTreeToggle<cr>
map <F9>    :LLPStartPreview<cr>
map <F10>   :PluginInstall<cr>
map <F11>   :PluginUpdate<cr>
map <F12>   :PluginClean<cr>

" map keys for Copy/Pasting
map <C-c> "+y
map <C-x> "+d
map <C-v> "+P

" Luke Smith's keybindings for editing
" Navigating with guides
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

"" tex
autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i

"" html, php
autocmd FileType php,html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;i <i></i><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;u <u></u><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;em <em></em><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;p <p></p><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;div <div></div><Space><++><Esc>FbT>i

