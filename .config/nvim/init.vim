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
Plug 'mbbill/undotree'
Plug 'ycm-core/YouCompleteMe'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mattn/emmet-vim'
call plug#end()

syntax on
filetype plugin on

set nocompatible
set exrc
set mouse=a
set clipboard+=unnamedplus
set encoding=utf-8
set wildmode=longest,list,full
"set termguicolors

set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

set number relativenumber	      " show line numbers
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set incsearch
set hlsearch
set splitbelow splitright
set colorcolumn=80

colorscheme dracula
set bg=dark

hi ColorColumn ctermbg=0 guibg=lightgrey
hi Search cterm=NONE ctermfg=black ctermbg=blue guibg=blue guifg=black

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let mapleader = ','
map <leader>n	:NERDTreeToggle<cr>
map <leader>u	:UndotreeToggle<cr>
map <leader>g	:Magit<cr>
map <leader>pi	:PlugInstall<cr>
map <leader>pu	:PlugUpdate<cr>
map <leader>pc	:PlugClean<cr>

" map keys for Copy/Pasting
vnoremap    <C-c> "+y
vnoremap    <C-x> "+d
map         <leader>v "+p
map			<leader>a <Esc>"_ggVG

" map navigation keys
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" YouCompleteMe plugin
nnoremap <buffer> <leader>yd :YcmCompleter GoTo<CR>
nnoremap <buffer> <leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <buffer> <leader>rr :YcmCompleter RefactorRename<space>

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

" source config files when saving
autocmd BufWritePost *bashrc,*zshrc !source %
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
autocmd BufWritePost files,directories !shortcuts

" Delete trailing spaces when saving files
autocmd BufWritePre * %s/\s\+$//e

