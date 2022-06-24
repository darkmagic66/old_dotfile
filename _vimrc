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
set pythonthreehome=C:\Users\empty\AppData\Local\Programs\Python\Python37
set pythonthreedll=C:\Users\empty\AppData\Local\Programs\Python\Python37\pthon37.dll
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
map <C-n> :NERDTreeToggle<CR>
noremap <leader>ci :NERDComInvertComment

"compile 
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>
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

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"Plugin Start here
call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'			
Plug 'airblade/vim-gitgutter'		
Plug 'jiangmiao/auto-pairs' 		
Plug 'scrooloose/nerdtree'			
Plug 'scrooloose/nerdcommenter'		

call plug#end()
