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
set pythonthreehome=C:\Users\empty\AppData\Local\Programs\Python\Python37
set pythonthreedll=C:\Users\empty\AppData\Local\Programs\Python\Python37\pthon37.dll

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
call plug#end()


"Plug Confic

"close tag

"let g:closetag_shortcut = '>'
"let g:closetag_close_shortcut = '<leader>>'
"let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
"let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
"let g:closetag_filetypes = 'html,xhtml,phtml'
"let g:closetag_xhtml_filetypes = 'xhtml,jsx'
"let g:closetag_emptyTags_caseSensitive = 1
"let g:closetag_regions = {
    "\ 'typescript.tsx': 'jsxRegion,tsxRegion',
    "\ 'javascript.jsx': 'jsxRegion',
    "\ 'typescriptreact': 'jsxRegion,tsxRegion',
    "\ 'javascriptreact': 'jsxRegion',
    "\ }

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

