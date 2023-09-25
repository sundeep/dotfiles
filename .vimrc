" heavily inspired by http://stevelosh.com/blog/2010/09/coming-home-to-vim

" initial version
set nocompatible
" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')
" Plugins from github repos:

" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'

" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Surround
Plug 'tpope/vim-surround'

" Syntastic
"Plug 'scrooloose/syntastic'

" Git integration
Plug 'tpope/vim-fugitive'

" buffer stuff
Plug 'fholgado/minibufexpl.vim'

" Ack
Plug 'mileszs/ack.vim'

Plug 'lifepillar/vim-solarized8'

" YouCompleteMe
"Plug 'Valloric/YouCompleteMe'

" SimpylFold
Plug 'tmhedberg/SimpylFold'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif


" basic shit
filetype plugin indent on
syntax on
syntax enable

" get semicolon to behave like colon
nnoremap ; :

" tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"display tabs and trailing spaces
"set list
"set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" sanity stuff
set number
"set relativenumber
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

" folding stuff
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=0

" set leader
let mapleader = "\<Space>"

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

" ack.vim
" The Silver Searcher
if executable('ag')
    let g:ackprg = 'ag --vimgrep'

    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0

    " bind K to grep word under cursor
    nnoremap S :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

" long lines
set wrap
set textwidth=110
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

" airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" leader stuff

" load vimrc by running ",ev"
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" open files with leader-o
nnoremap <Leader>o :CtrlP<CR>

" gui how i like it
set guifont=Monaco:h14
set background=dark
set termguicolors
colorscheme solarized8

" swap stuff
set nobackup
set nowritebackup
set noswapfile

" my local customizations
"
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" NerdTree customizations
" Toggle NerdTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=25
let NERDTreeIgnore = ['\.pyc$']
