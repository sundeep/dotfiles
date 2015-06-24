" heavily inspired by http://stevelosh.com/blog/2010/09/coming-home-to-vim

" initial version
set nocompatible

" get pathogen running
filetype off
execute pathogen#infect()

" basic shit
syntax on
filetype plugin indent on

" tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" sanity stuff
set number
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile

" set leader
let mapleader = ","

" tame searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=110

" play vim on hard mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" leader stuff

" load vimrc by running ",ev"
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" gui how i like it
set guifont=Monaco:h14
set background=dark
colorscheme solarized

" swap stuff
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
