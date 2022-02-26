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
Plug 'ap/vim-css-color'
"Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'mbbill/undotree'
Plug 'jreybert/vimagit'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

syntax on
filetype plugin on

set nocompatible
set exrc
set mouse=a
set clipboard+=unnamedplus
set encoding=UTF-8
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

"set showtabline=2
"set noshowmode

colorscheme dracula
set bg=dark

hi ColorColumn ctermbg=7 guibg=lightgrey
hi Search cterm=NONE ctermfg=black ctermbg=blue guibg=blue guifg=black

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

let g:airine_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = 'E:'
let g:airline#extensions#coc#warning_symbol = 'W:'

let mapleader = ','
map <leader>n	:NERDTreeToggle<cr>
map <leader>u	:UndotreeToggle<cr>
map <leader>g	:Magit<cr>
map <leader>pi	:PlugInstall<cr>
map <leader>pu	:PlugUpdate<cr>
map <leader>pU	:PlugUpgrade<cr>
map <leader>pc	:PlugClean<cr>

" map keys for Copy/Pasting
nnoremap    <leader>y "+y
nnoremap    <leader>Y gg"+yG
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

