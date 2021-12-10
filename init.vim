syntax on
"Set register"
set clipboard=unnamedplus

"Show Number and Ralativenumber"
set number
set relativenumber 

"Show line and column number of the cursor position"
set ruler 

"Set search"
set hls
set incsearch
set ignorecase

"Set indent"
set autoindent  
set smartindent 
set tabstop=4
set shiftwidth=4 

"Show incomplete command"
set showcmd

"Show list of command when tab"
set wildmenu

"z + enter"
set scrolloff=5

"Disable swapfile"
set noswapfile

"remap key"
let mapleader = "'"
"map <C-n> :NERDTreeToggle<CR>
nmap gf ggVGy
inoremap jk <ESC>
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

let g:airline_powerline_fonts = 1
noremap <F9> <ESC> :w <CR> :!g++  -std=c++17 -Wall -O2 -o %< % <CR>
