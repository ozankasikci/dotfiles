"{{{ Mappings

let mapleader=" "
map <leader>k :E<cr>
inoremap jk <Esc>
inoremap <C-a> <Esc>A
inoremap <C-i> <Esc>I
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja
nnoremap <leader>s /
"}}}


"{{{ Mics settings

" indent line settings
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_color_term = 234


" 80 characters guide line
set colorcolumn=81


" to prevent press enter warning on start
let g:bufferline_echo=0


"For Air-line plugin
set laststatus=2


set rtp+=~/.fzf
set runtimepath^=~/.vim/bundle/ctrlp.vim
set nocompatible
set showcmd
filetype on
filetype plugin on
syntax enable
set cursorline
set grepprg=grep\ -nH\ $*
set autoindent
set smarttab
set shiftwidth=2
set softtabstop=2
set wildmenu
set wildmode=list:longest,full
set mouse=a
set number
set ignorecase
set smartcase
set incsearch
set hlsearch
set nohidden
highlight MatchParen ctermbg=4

"}}}


"{{{ Pathogen

execute pathogen#infect()
syntax on
filetype plugin indent on

"}}}


"{{{ Others

color strange

"}}}
