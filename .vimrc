inoremap jk <ESC>
let mapleader = " "
filetype plugin on
filetype indent on
syntax on
set encoding=utf-8 

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

set ruler
set cmdheight=2
set hlsearch
set incsearch
set showmatch

set laststatus=2
