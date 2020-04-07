let mapleader = ','

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	if !executable("curl")
		autocmd VimLeavePre * call confirm("You must install curl!")
		execute "q!"
	endif
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !mkdir -p ~/.config/nvim/undodir/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jreybert/vimagit'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

set bg=light
set go=a
set mouse=a
set clipboard+=unnamedplus

set nocompatible
set encoding=utf-8
set number relativenumber	      " show line numbers
set wildmode=longest,list,full
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set splitbelow splitright
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
filetype plugin on
syntax on

map <C-n>	:NERDTreeToggle<cr>
map <C-g>	:Magit<cr>
map <F10>	:PlugInstall<cr>
map <F11>	:PlugUpdate<cr>
map <F12>	:PlugClean<cr>

" map keys for Copy/Pasting
vnoremap    <C-c> "+y
vnoremap    <C-x> "+d
map         <C-v> "+p
"map			<C-a> <Esc>"_ggVG

" map navigation keys
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" compiler on writing to file
map <leader>c :w! \| !compiler <c-r>%<CR>

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Clear tex files builds
autocmd VimLeave *.tex !texclear %

" Ensure of filetype when a new/read file is opened
autocmd BufRead,BufNewFile *.tex set filetype=tex

" source config files when after saving
autocmd BufWritePost *bashrc,*zshrc !source %
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
autocmd BufWritePost files,directories !shortcuts

" Delete trailing spaces when saving files
autocmd BufWritePre * %s/\s\+$//e

