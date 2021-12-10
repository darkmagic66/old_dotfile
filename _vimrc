"plugin"

execute pathogen#infect()
filetype plugin indent on

"Set GUI"
syntax on
set background=light
colorscheme solarized8
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep =''
let g:airline#extensions#tabline#left_alt_sep =''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme = 'solarized'
set laststatus=2
if has("gui_running")
	set guioptions -=m
	set guioptions -=T
  	if has("gui_gtk2")
		set guifont=utf-8:h11
  	elseif has("gui_macvim")
    	set guifont=Menlo\ Regular:h14
  	elseif has("gui_win32")
    	set guifont=Consolas:h11:cANSI
  	endif
endif

"Fix backspace"
:set backspace=indent,eol,start

"Set register"
set clipboard=unnamed

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
map <C-n> :NERDTreeToggle<CR>
nmap gf ggVGy
inoremap jk <ESC>

"Path"
cd E:\Code\Code C++\Vim C++

"Compile and Run C++"

autocmd filetype c nnoremap <F9> :w <bar> !gcc -std=c11 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype c nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <F11> :w <bar> !g++ -std=c++11 -O2 -Wall % -o %:r && %:r.exe <CR>

"Compile and Run C
"autocmd filetype c nnoremap <F9> :w <bar> !gcc -std=c11 % -o %:r -Wl,--stack,268435456<CR>
"autocmd filetype c nnoremap <F10> :!%:r<CR>