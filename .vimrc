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
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'sickill/vim-monokai'
Bundle 'reewr/vim-monokai-phoenix'
Plugin 'dracula/vim'
Plugin 'xuhdev/vim-latex-live-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set encoding=utf-8
set mouse=a
syntax on

set ruler                         " show row and column in footer
set number			  " show line numbers
set relativenumber			  " show line numbers
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set clipboard=unnamed             " use the system clipboard
set hlsearch                      " highlight all search matches
set tabstop=4
set shiftwidth=4
set expandtab

" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]\ %y

colorscheme monokai-phoenix

hi Normal ctermbg=none
" hi StatusLine ctermbg=8 ctermfg=4 cterm=none

map <C-p> :NERDTreeToggle<cr>
map <C-r> :LLPStartPreview<cr>
map <C-i> :PluginInstall<cr>
map <C-u> :PluginUpdate<cr>

autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType php,html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;i <i></i><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;u <u></u><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;em <em></em><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;p <p></p><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;div <div></div><Space><++><Esc>FbT>i

let g:livepreview_previewer = 'evince'
let g:livepreview_engine = 'pdflatex'
