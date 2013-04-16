set nocompatible                " be iMproved
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12
if has("syntax")
  syntax on
endif
set background=dark             " sets the background color (I like it dark)
"colorscheme desert             " colorscheme
colorscheme twilight            " colorscheme

set cursorline                  " highlight current line

set nowrap                      " nowrap
set showcmd                     " show cmd
set showmatch                   " show matching brackets
set showbreak=...               " show '...' if line is longer than screen
set mat=5                       " how many tenths of a second to blink matching brackets
set incsearch                   " show search matches as you type
" set lines=50                    " height
set novisualbell                " no error bells
set noerrorbells                " no error bells
set title                       " sets the title
set wildmenu                    " show autocomplete options
set textwidth=120               " sets the text width
set tabpagemax=10 		" show 10 tabs

" search
set ignorecase                  " case insensitive search
set smartcase
set magic                       " enable advanced regular expressions
set hlsearch                    " enables highlighting search

" text
set autoindent                  " use curr line's indent to set indent of new line
set smartindent                 " vim guesses indent level
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set gdefault                    " the /g flag on :s substitutions by default


set modeline                    " respect other
set encoding=utf-8              " use utf-8 encoding

set number                      " set line numbers

set ruler                       " show ruler
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

set laststatus=2                " always show last status

set history=1000                " 1000 lines of history
set undolevels=1000             " 1000 levels of undo
set clipboard=unnamed           " share clipboard with win
set ffs=unix,dos,mac            " set file format to unix, win, then old mac
set hidden                      " enable hidden files
set backspace=indent,eol,start  " enable backspace over indent, EOL, START

if has("undodir")
    set undodir=$HOME/.vim_undo " directory to store backup files
    set undofile                " save undo history to an undo file"
    if ! isdirectory(expand(&undodir))
        call mkdir(&undodir, 'p', 0700 )
    endif
endif

set backupext=.bak               " append .bak to backup files

set backupdir=$HOME/.vim_backups " directory to store backup files
if ! isdirectory(expand(&backupdir))
    call mkdir(&backupdir, 'p', 0700)
endif

set directory=$HOME/.vim_swaps   " directory to store swap files
if ! isdirectory(expand(&directory))
    call mkdir(&directory, 'p', 0700)
endif

set autowrite                    " enable buffers to be saved on suspend
" }}}

" Theme {{{
if has("syntax")
    syntax on
endif

" cmd line
" change working directory to that of file
cmap <Leader>cd lcd %:p:h              

" bash like commands in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-k> <C-U>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" keyboard mapping
" remap 0 to first word (going to the first col is kinda useless)
map 0 ^

" fix teh broken
nnoremap / /\v
vnoremap / /\v

" remap ESC in insert mode to jk - faster than jj?
inoremap jk <ESC>
inoremap kj <ESC>

" simplify window navigation with ctrl
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

" make Y act like C/D
nmap Y y$

" ; for : in normal/visual
nnoremap ; :
vnoremap ; :

" clear search matching across all buffers
noremap <Leader><space> :noh<CR>:call clearmatches()<CR>

" match braces using a tab
map <TAB> %

" <Leader>cd switches to directory of open buffer
map <Leader>cd :cd %:p:h<CR>

" <Leader>D to make you smile
map <Leader>d :Nyan<CR>

" <Leader>dc to show diff of current buffer
map <Leader>dc :DiffChangesDiffToggle<CR>

" <Leader>dp to show patch of current buffer
map <Leader>dp :DiffChangesPatchToggle<CR>

" <Leader>f to start an Ack search
map <Leader>f :Ack<space>

" <Leader>h/l to go to previous/next in jumplist
nnoremap <Leader>h <C-O>
nnoremap <Leader>l <C-i>

" <Leader>G to create private Gist of entire buffer
map <Leader>G :Gist -p<CR>

" <Leader>n to toggle NerdTreeTabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" <Leader>num to toggle relative numbers
map <Leader>num :NumbersToggle<CR>

" <Leader>o to open bufExplorer
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <Leader>o :BufExplorerVerticalSplit<CR>

" ctrl-p shortcuts
set wildignore+=*.o,*.obj,.git,.svn,.hg,*.pyc
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlPMixed'

" <Leader>pb to preview buffer with hammer.vim
map <Leader>pb :Hammer<CR>

" <Leader>s to open scratch in split window
map <Leader>s :Sscratch<CR>

" CTags
map <Leader>tag :!ctags --extra=+f -R *<CR><CR>

" <Leader>tl to open Taglist project
map <Leader>tl :TlistToggle<CR>

" <Leader>u to toggle Gundo
nnoremap <Leader>u :GundoToggle<CR>

" <Leader>ws to clean trailing white space
map <Leader>ws :%s/\s\+$//e<CR>

" <Leader>x to show TODO list
map <Leader>x <Plug>TaskList

" <Leader>Y to bring up YankRing
map <Leader>Y :YRShow<CR>

" <Leader><Leader> to ZoomWin
map <Leader><Leader> :ZoomWin<CR>

" <F2> to toggle invisible characters
map <silent> <F2> :set invlist<CR>

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'Lokaltog/powerline.git', {'rtp': 'powerline/powerline/bindings/vim/plugin/'}
Bundle 'vim-scripts/ScrollColors'
Bundle 'kien/ctrlp.vim'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

