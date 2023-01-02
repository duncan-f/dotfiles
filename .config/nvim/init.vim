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
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'mbbill/undotree'
Plug 'phelipetls/vim-hugo'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'VonHeikemen/lsp-zero.nvim'
call plug#end()

syntax on
filetype plugin on

set nocompatible
set mouse=a
set clipboard+=unnamedplus
set encoding=UTF-8
set wildmode=longest,list,full

set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

set number relativenumber	      " show line numbers
set tabstop=4 softtabstop=4 shiftwidth=4
set smartindent
set incsearch
set nohlsearch
set splitbelow splitright
set colorcolumn=80

colorscheme gruvbox
set bg=dark

hi ColorColumn ctermbg=7 guibg=lightgrey
hi Search cterm=NONE ctermfg=black ctermbg=blue guibg=blue guifg=black

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Emmet remap
let g:user_emmet_leader_key='<C-s>'

let mapleader = ','
map <leader>n	:Ex<cr>
map <leader>u	:UndotreeToggle<cr>

" Plug keymapping
map <leader>pi	:PlugInstall<cr>
map <leader>pu	:PlugUpdate<cr>
map <leader>pU	:PlugUpgrade<cr>
map <leader>pc	:PlugClean<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>gg <cmd>Telescope git_files<cr>

" map keys for Copy/Pasting
xnoremap    <leader>p "_dP
nnoremap    <leader>y "+y
vnoremap    <leader>y "+y
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
map <C-S-n> :bn
map <C-S-p> :bp

lua <<EOF
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()
EOF

" compiler on writing to file
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Clear tex files builds
autocmd VimLeave *.tex !texclear %

" Ensure of filetype when a new/read file is opened
autocmd BufRead,BufNewFile *.tex set filetype=tex

" source config files when saving
autocmd BufWritePost *bashrc,*zshrc !source %
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
autocmd BufWritePost files,directories !shortcuts

" Delete trailing spaces when saving files
autocmd BufWritePre * %s/\s\+$//e

