" heavily inspired by http://stevelosh.com/blog/2010/09/coming-home-to-vim

" experimenting with 'Q' quitting window
map Q :q<CR>
 

" initial version
set nocompatible

" get pathogen running
filetype off
execute pathogen#infect()
call pathogen#helptags()

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
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

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

" folding stuff
set foldmethod=indent
set foldnestmax=2

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
" open ag.vim
nnoremap <leader>a :Ag

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

" leader stuff

" load vimrc by running ",ev"
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" open files with leader-o
nnoremap <Leader>o :CtrlP<CR>

" gui how i like it
set guifont=Monaco:h14
set background=dark
colorscheme solarized

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

" NerdTree customizations
" Toggle NerdTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=25
let NERDTreeIgnore = ['\.pyc$']

" TAG STUFF
" look in current directory tree for tags file
set tags=./tags,tags;
"set tags=./.tags;,~/.vimtags;$HOME

""""" Settings for taglist.vim
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1
nmap <leader>tt :TlistOpen<cr>
" let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'  " Proper ctags location

" Toggle Tagbar with F8
" nmap <F8> :TagbarToggle<CR>

" check syntax/pep8 with F9
nmap <F9> :SyntasticCheck<CR>

" syntastic settings
set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_flake8_args="--ignore=E501,E128,E225 --max-line-length=110"
let g:syntastic_python_flake8_post_args="--ignore=E501,E128,E225 --max-line-length=110"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" python specific mappings
"" insert breakpoints using leader b/B
map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0

"http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
"hacks from above (the url, not jesus) to delete fugitive buffers when we
"leave them - otherwise the buffer list gets poluted
"
"add a mapping on .. to view parent tree
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
