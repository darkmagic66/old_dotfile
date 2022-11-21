"general config
syntax on
set encoding=utf-8
set clipboard=unnamed
set gfn=Fixedsys:h10 "guifont

"UI
set showcmd
set wildmenu
set scrolloff=10

"disable annoying thing
set noswapfile
set noundofile
set backspace=indent,eol,start

"line and number
set number 
set relativenumber
set ruler

"serach
set hls
set incsearch
set ignorecase

"indent
set autoindent
set smartindent
set ts=4
set sw=4

"python
set pythonthreehome=C:\Users\empty\AppData\Local\Programs\Python\Python311
set pythonthreedll=C:\Users\empty\AppData\Local\Programs\Python\Python311\python311.dll

"colorscheme nord
"set background=light
"colorscheme solarized
colorscheme codedark
cd C:\Users\empty\Code

"remap
let mapleader = ";"
inoremap jk <ESC>
nmap gf ggVGy

"inoremap { {}<Left>
"inoremap {<CR> {<CR>}<Esc>O
"inoremap {{ {
"inoremap {} {}


"plugin remap

" auto complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" nerd pulgin
map <C-n> :NERDTreeToggle<CR>
noremap <leader>ci :NERDComInvertComment

" fzf serach + buffer
nnoremap <C-P>  :Files<CR>
nnoremap <C-B>  :Buffers<CR>

"compile 
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
"autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <F10> :!./%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

"font 
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

"Plugin Start here
call plug#begin()

Plug 'junegunn/vim-easy-align'

"Git
Plug 'tpope/vim-fugitive'			
Plug 'airblade/vim-gitgutter'		

"Utility
Plug 'jiangmiao/auto-pairs' 		
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'

"UI
Plug 'scrooloose/nerdtree'			
Plug 'scrooloose/nerdcommenter'		

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Theme
"Plug 'arcticicestudio/nord-vim'
"Plug 'altercation/vim-colors-solarized'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Snippet
"Plug 'Mathijs-Bakker/vim-unity-snippets'
Plug 'ycm-core/youcompleteme'

call plug#end()

"Plug Confic


"YCM 

"Preview
set completeopt-=preview
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
"Error
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 1


