let mapleader = ','

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	if !executable("curl")
		autocmd VimLeavePre * call confirm("You must install curl!")
		execute "q!"
	endif
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jreybert/vimagit'
Plug 'vim-airline/vim-airline'
call plug#end()

set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus

set nocompatible
set encoding=utf-8
set number relativenumber	      " show line numbers
set wildmode=longest,list,full
set tabstop=4
set shiftwidth=4
filetype plugin on
syntax on

" source config files when after saving
autocmd BufWritePost *bashrc,*zshrc !source %
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
autocmd BufWritePost ~/.config/files,~/.config/directories !shortcuts && source ~/.bashrc && . ~/.zshrc

" Delete trailing spaces when saving files
autocmd BufWritePre * %s/\s\+$//e

" Clear tex files builds
autocmd VimLeave *.tex !texclear %

" Ensure of filetype when a new/read file is opened
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Reload sxhkd keybinds
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

map <leader>n    :NERDTreeToggle<cr>
map <leader>g   :Magit<cr>
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

