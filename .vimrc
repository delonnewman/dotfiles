set nocompatible
set encoding=utf-8
filetype off

set shell=/bin/bash

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundles
" General
Plugin 'tpope/vim-surround'
Plugin 'taglist.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vimwiki'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-dispatch'
Plugin 'golden-ratio'
Plugin 'rizzatti/dash.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-projectionist'
Plugin 'dag/vim-fish'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Perl
Plugin 'vim-perl/vim-perl'

" Ruby
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'

" Markdown
Plugin 'tpope/vim-markdown'

" Java/JVM
"Plugin 'tpope/vim-classpath'

" Clojure
"Plugin "tpope/vim-fireplace"
"Plugin "tpope/vim-leiningen"
"Plugin "guns/vim-clojure-static"
"Plugin "guns/vim-clojure-highlight"

" Lisps
Plugin 'kien/rainbow_parentheses.vim'
"Plugin "bhurlow/vim-parinfer"
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Racket
"Plugin 'scribble.vim'
"Plugin 'wlangstroth/vim-racket'

" Prolog
"Plugin 'mndrix/prolog.vim'

" JavaScript, etc.
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-coffee-script'

call vundle#end()

" General
filetype on
filetype plugin on
filetype indent plugin on
set ofu=syntaxcomplete#Complete
set modeline
set history=1000
set clipboard+=unnamed
set ffs=unix,dos,mac
set viminfo+=!

set backup
set swapfile
set backupdir=~/.vim-tmp,/tmp
set directory=~/.vim-tmp,/tmp

" Theme/Colors
set background=dark
syntax on
"colorscheme solarized

" Vim UI
set wildmenu
set ruler
set cmdheight=1
set number numberwidth=4
set lz " do not redraw when running macros
set hid " change buf without saving
set backspace=2
set whichwrap+=<,>,h,l
set mouse=a
set shortmess=atI

" Visual Cues
set showmatch " show matching brackets
set mat=5 " rate of bracket blinkage (in tenths of a sec)
set nohlsearch " no hightligh for search phrases
set incsearch " but do highlight while searching
set so=10

"set statusline=%F%m%r%h%w\ \|\ format:%{&ff}\ \|\ type:%y\ \|\ l%4.4l,\ c%4.4v\ \|\ %3.3p%%\ \|\ len:%L 
set laststatus=2 " always show the status line

" For Git Gutter on Windows
let g:gitgutter_avoid_cmd_prompt_on_windows = 0

" Syntastic for JavaScript
let g:syntastic_javascript_checkers = ['jshint']

"let g:syntastic_javascript_checkers = ["closurecompiler"] 
"let g:syntastic_javascript_closurecompiler_path = '/usr/local/bin/closure-compiler'

set listchars=tab:¬\ ,trail:·,eol:¶,extends:░,precedes:░,nbsp:·

" Text Formatting/Layout
set ai " autoindent
set si " smartindent
set cindent " c style indenting
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set smarttab

" Python indent
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

" Boot files
au BufRead *.boot set filetype=clojure

" WonderScript files
au BufRead *.ws set filetype=clojure

" Fish Shell
au BufRead *.fish set filetype=sh

iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
