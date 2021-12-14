syntax on

set clipboard=unnamedplus
set noswapfile

set number
set relativenumber 
set ruler 
set showcmd
set wildmenu

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set hls
set incsearch
set ignorecase

set autoindent  
set smartindent 
set tabstop=4
set shiftwidth=4 
set scrolloff=5


"remap key"
let mapleader = "'"
map <C-n> :NERDTreeToggle<CR>
nmap gf ggVGy
inoremap jk <ESC>

noremap <F8> <ESC> :w <CR> :!g++  -std=c++17 -Wall -O2 -o %< % <CR>
noremap <F9> <ESC> :!./%:r <CR>

"Vundle

set nocompatible              
filetype off                  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"Start Here
Plugin 'gruvbox-community/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()            
filetype plugin indent on   

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

let g:airline_powerline_fonts = 1
