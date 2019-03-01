set nocompatible
set encoding=utf-8

" Pathogen
call pathogen#infect()

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
" General
Bundle "gmarik/vundle"
Bundle "tpope/vim-surround"
"Bundle "mattn/webapi-vim"
"Bundle "mattn/gist-vim"
"Bundle "mattn/calendar-vim"
Bundle "taglist.vim"
Bundle "mileszs/ack.vim"
Bundle "vimwiki"
Bundle "altercation/vim-colors-solarized"
Bundle "tpope/vim-vinegar"
"Bundle "ledger/vim-ledger"
Bundle "kien/ctrlp.vim"
Bundle "tpope/vim-dispatch"
Bundle "golden-ratio"
Bundle "rizzatti/dash.vim"
Bundle "ctrlpvim/ctrlp.vim"
Bundle "vim-airline/vim-airline"
Bundle "vim-airline/vim-airline-themes"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-projectionist"

" CSV
Bundle "csv.vim"

" Git
Bundle "tpope/vim-fugitive"
Bundle "airblade/vim-gitgutter"

" Perl
Bundle "vim-perl/vim-perl"

" Ruby
Bundle "tpope/vim-rails"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-rake"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-rbenv"

" Markdown
Bundle "tpope/vim-markdown"

" Java/JVM
Bundle "tpope/vim-classpath"

" Clojure
"Bundle "tpope/vim-fireplace"
"Bundle "tpope/vim-leiningen"
"Bundle "guns/vim-clojure-static"
"Bundle "guns/vim-clojure-highlight"

" Lisps
Bundle "kien/rainbow_parentheses.vim"
"Bundle "bhurlow/vim-parinfer"
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Racket
"Bundle "scribble.vim"
"Bundle "wlangstroth/vim-racket"

" Prolog
"Bundle "mndrix/prolog.vim"

" JavaScript, etc.
Bundle "leafgarland/typescript-vim"
Bundle "vim-coffee-script"

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
