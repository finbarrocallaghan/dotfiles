set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"plugin bundles 

Bundle 'mutewinter/LustyJuggler'

"ui additions 
Bundle 'Lokaltog/vim-powerline'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'scrooloose/nerdtree'

"commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

Bundle 'wincent/Command-T'
Bundle 'Rykka/ColorV'
Bundle 'gregsexton/MatchTag'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'kien/ctrlp.vim'


Bundle 'vim-scripts/matchit.zip'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/Gundo'
Bundle 'vim-scripts/git-time-lapse'
Bundle 'tpope/vim-fugitive'

Bundle 'vim-scripts/desert-warm-256'

filetype plugin indent on
" -------------------------


let mapleader=","
call pathogen#infect()
set shell=/bin/zsh

"color 
set background=dark
colorscheme candy
set t_Co=256

if $TERM=='screen-256color'
  autocmd BufEnter * let &titlestring = "[".expand("%:t") ."]" 
  exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
endif


"ui
"set ruler
"set nu
set nowrap
set laststatus=2
"set cmdheight=2
set fillchars=""
set encoding=utf-8
set synmaxcol=2048



"backup 
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"behaviours
syntax enable
set mousehide
set autoread
set wildmenu
set wildmode=longest,list
set hidden
set history=900
set cf
set clipboard+=unnamed
set autowrite
set timeoutlen=350
set textwidth=100
set formatoptions=crql
set cpoptions=ces$


"text format
set tabstop=2
set shiftwidth=2
set cindent
set autoindent
set smarttab
set expandtab
set backspace=2

"searching
set ignorecase
set smartcase
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.so,*.pyc,.git

"visual
set showmatch



"bindings
map <F1> <Esc>
imap <F1> <Esc>
nmap K k
vmap K k
noremap Y y$  
map - :nohls<cr>


command Bp :w<Bar>bp
command Bn :w<Bar>bn

"leader commands
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>
nmap <silent> <leader>p  :set invpaste<CR>:set paste?<CR>




"gui
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guioptions=ac

set diffopt+=iwhite


"autocmd BufNewFile,BufRead *.py compiler python 
"imap <F1> from IPython.Debugger import Tracer; d_h = Tracer()
 
 
let g:pyflakes_autostart = 0
let g:pyflakes_use_quickfix = 0
map <F12> :PyflakesToggle<cr>


"indent guides
"==============
"let g:indent_guides_enable_on_vim_startup=1 

"vundle
"=======

nmap <leader>bi :BundleInstall<CR>
nmap <leader>bu :BundleInstall!<CR>
nmap <leader>bc :BundleClean<CR>


"lustyjuggler
"=============

let g:LustyJugglerAltTabMode = 1
nmap <silent> <c-b> :LustyJuggler<CR>

nmap <silent> <c-n> :NERDTreeToggle<CR>


"nerdtree
"=========

                    
let g:NERDTreeMapOpenVSplit = "s"
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()


"gundo 
"=======
noremap <F5> :GundoToggle<CR> 
let g:gundo_right = 1
let g:gundo_preview_bottom = 1
let g:gundo_close_on_revert = 1
