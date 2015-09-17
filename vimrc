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
Plugin 'junegunn/fzf'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'keith/parsec.vim'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'
Plugin 'wavded/vim-stylus'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bling/vim-bufferline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'takac/vim-spotifysearch'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'xolox/vim-colorscheme-switcher'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"}}}


"{{{ Mappings

" Ulti-snips configuration
let g:UltiSnipsExpandTrigger="<C-K>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit ="vertical"

let mapleader=" "
map <leader>k :E<cr>
inoremap jk <Esc>
inoremap <C-a> <Esc>A
inoremap <C-i> <Esc>I
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <leader>s /
nnoremap <leader>1 :NERDTreeToggle<cr>
nnoremap <leader>l :CoffeeLint <bar> cwindow<cr>
nnoremap <C-l> :b#<cr>
nnoremap <C-m> :MRU<cr>

" quick resize panes
if bufwinnr(1)
  map <C-Up> <C-W><
  map <C-Down> <C-W>>
endif

"}}}


"{{{ Mics settings

" to be able to use backspace in insert mode
set backspace=indent,eol,start

" enable 80 characters guide line
set colorcolumn=80

" to prevent press enter warning on start
let g:bufferline_echo=0

" For Air-line plugin
set guifont=Liberation_Mono_for_Powerline:h10
set laststatus=2
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='jellybeans'

" vim silver searcher settings
let g:ag_working_path_mode="r"

" to be able to yank in paste between tmux panes
set clipboard=unnamed

" settings for ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" to be able to open required node files pressing gf
set suffixesadd+=.coffee

set nocompatible
set showcmd
filetype on
filetype plugin on
syntax enable
set cursorline
set grepprg=grep\ -nH\ $*
set autoindent
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wildmenu
set wildmode=list:longest,full
set mouse=a
set number
set ignorecase
set smartcase
set incsearch
set hlsearch
set nohidden
set relativenumber
highlight MatchParen ctermbg=4

"}}}


"{{{ Tmux settings

if &term =~ '^screen' && exists('$TMUX')
    set mouse+=a
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    autocmd VimEnter * Tmuxline vim_statusline_3
    let g:tmuxline_preset = {
      \'a'    : '#S',
        \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
        \'win'  : ['#I', '#W'],
        \'cwin' : ['#I', '#W', '#F'],
        \'x'    : '#(/usr/bin/battery -t)',
        \'y'    : ['%R', '%a', '%e-%B'],
        \'z'    : '#H'}
endif

"}}}


"{{{ Pathogen

execute pathogen#infect()
syntax on
filetype plugin indent on

"}}}


"{{{ Visual Stuff

" indent line settings
let g:indentLine_enabled = 1
let g:indentLine_char = '│'

" set colorscheme
"color up
"color strange
"color apprentice
"color sol-term
"color hybrid
color coffee

" for apprentice
hi ColorColumn guibg=#2d2d2d ctermbg=236
" for sol-term
"hi ColorColumn guibg=#2d2d2d ctermbg=254

" for apprentice
hi CursorLine ctermbg=235
" for sol-term
"hi CursorLine ctermbg=231

" for apprentice
let g:indentLine_color_term = 235
" for sol-term
"let g:indentLine_color_term = 253

" git gutter signs
let g:gitgutter_sign_added = 'xx'
let g:gitgutter_sign_modified = 'yy'
let g:gitgutter_sign_removed = 'zz'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = 'ww'

" don't change tmux-line theme
let g:airline#extensions#tmuxline#enabled = 0

" clear git gutter background
highlight clear SignColumn

" change git gutter colors
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

"}}}
