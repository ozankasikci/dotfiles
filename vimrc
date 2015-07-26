"{{{ Vundle 

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'L9'
Plugin 'rking/ag.vim'
Plugin 'yegappan/mru'
Plugin 'tomtom/tlib_vim'
Plugin 'keith/parsec.vim'
Plugin 'wavded/vim-stylus'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'garbas/vim-snipmate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bling/vim-bufferline'
Plugin 'flazz/vim-colorschemes'
Plugin 'kchmck/vim-coffee-script'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'xolox/vim-colorscheme-switcher'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"}}}

"{{{ Mappings

" changes snipmate trigger key
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

let mapleader=" "
map <leader>k :E<cr>
inoremap jk <Esc>
inoremap <C-a> <Esc>A
inoremap <C-i> <Esc>I
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <leader>s /
nnoremap <leader>1 :NERDTreeToggle<cr>
"}}}


"{{{ Mics settings

" indent line settings
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_color_term = 234


" enable 80 characters guide line
set colorcolumn=80


" to prevent press enter warning on start
let g:bufferline_echo=0


"For Air-line plugin
set laststatus=2


set rtp+=~/.fzf
set runtimepath^=~/.vim/bundle/ctrlp.vim
"set nocompatible
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


"{{{ Visual Stuff

color strange

"}}}
