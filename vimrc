"lots of of bits taken from various github rc files and elsewhere
"basic structure from github.com/gmarik
 
set nocompatible

"color ----------------------------------------------------------------------{{{
 
colorscheme candy
set background=dark
set t_Co=256
if $TERM=='screen-256color'
  autocmd BufEnter * let &titlestring = "[".expand("%:t") ."]" 
  exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
endif

"}}}
 
"ui -------------------------------------------------------------------------{{{
 
set shell=/bin/zsh
set laststatus=2
set fillchars=""
set encoding=utf-8
set synmaxcol=2048
set showcmd
set number
set colorcolumn=81
set winheight=10

"}}}
 
"backup ---------------------------------------------------------------------{{{

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"}}}

"behaviours -----------------------------------------------------------------{{{
 
syntax enable
set mousehide
set autoread

set cursorline
hi clear CursorLine
hi CursorLine ctermbg=234

set wildmenu
set wildmode=longest:list

set wildchar=<Tab>
set completeopt+=preview


set history=900
set autowrite
set clipboard+=unnamed
set timeoutlen=750

set formatoptions=crql
set cpoptions=ces$

set hidden
set confirm

set dictionary=/usr/share/dict/words
set undofile

"}}}
 
"folding --------------------------------------------------------------------{{{
 
set foldlevelstart=0
set foldmethod=marker
":au BufWinLeave * mkview
":au BufWinEnter * silent loadview

"}}}
 
"text format ----------------------------------------------------------------{{{
 
set tabstop=2
set shiftwidth=2
set cindent
set autoindent
set smarttab
set expandtab
set backspace=2
set textwidth=118

"}}}
 
"searching ------------------------------------------------------------------{{{
 
set ignorecase
set smartcase
set incsearch
set hlsearch
set smartcase
set wildignore+=*.o,*.obj,*.so,*.pyc,.git

"}}}
 
"visual ---------------------------------------------------------------------{{{
 
set showmatch

"}}}
 
"bindings -------------------------------------------------------------------{{{

noremap + ;
noremap _ ,

let mapleader=","

map - :nohlsearch<cr>
map <F1> <Esc>
imap <F1> <Esc>

noremap Y y$  

vnoremap ; :
nnoremap ; :

vmap K k
nmap K k

cnoremap %% <C-R>=expand("%:p:h") . "/"<CR>
inoremap  jj <ESC>



" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO
"nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>


"command Bp :w<Bar>bp
"command Bn :w<Bar>bn


"leader commands
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>v :so ~/.vimrc<CR>
nmap <silent> <leader>p  :set invpaste<CR>:set paste?<CR>
nmap <silent> <leader>nu :set nu!<CR> 
nmap <silent> <leader>ul :t.\|s/./=/g\|set nohls<cr>

" Pulse Line {{{

function! s:Pulse() " {{{
    let current_window = winnr()
    windo set nocursorline
    execute current_window . 'wincmd w'
    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 9
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi
endfunction " }}}

command! -nargs=0 Pulse call s:Pulse()

"}}}
"}}}
 
""bundles/plugins etc.. -----------------------------------------------------{{{
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"{{{
"=====================
nmap <leader>bi :BundleInstall<CR>
nmap <leader>bu :BundleInstall!<CR>
nmap <leader>bc :BundleClean<CR>
"}}}
 
" don't want powerline running in the qvim gui
" nice markdown editing env
if has("gui_qt")
    set guicursor=n-v-c:block-Cursor-blinkon0
    set guicursor+=ve:ver35-Cursor
    set guicursor+=o:hor50-Cursor
    set guicursor+=i-ci:ver26-Cursor
    set guicursor+=r-cr:hor20-Cursor
    set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
    set guioptions=ac
    set diffopt+=iwhite
    au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call DistractionFreeWriting()
    function! DistractionFreeWriting()
        colorscheme iawriter
        set colorcolumn=0
        set background=light
        "set fuoptions=background:#00f5f6f6 
        set guioptions-=r
        set laststatus=0
        set noruler
        set lines=40 
        set columns=80
    endfunction 
else
    Bundle 'Lokaltog/vim-powerline' 
    "===============================
    let g:Powerline_symbols = 'compatible'
endif

Bundle 'tpope/vim-fugitive' 
"{{{======================
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gw :Gwrite<CR>
nmap <silent> <leader>ga :Gadd<CR>
nmap <silent> <leader>gci :Gcommit<CR>
nmap <silent> <leader>gl :Glog<CR>
"}}}
 
Bundle 'sjbach/lusty' 
"{{{=================
let g:LustyJugglerShowKeys   = 1
let g:LustyJugglerAltTabMode = 1
nmap <silent> <c-b> :LustyJuggler<CR>
"}}}
 
Bundle 'nathanaelkane/vim-indent-guides'
"{{{=================================
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1 
hi IndentGuidesEven ctermbg=234
hi IndentGuidesOdd  ctermbg=233
"hi IndentGuidesEven ctermbg=233
"hi IndentGuidesOdd  ctermbg=232
"}}}
 
Bundle 'scrooloose/nerdtree'
"{{{========================
nmap <silent> <c-n> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenVSplit = "s"
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"
let NERDTreeShowBookmarks=2
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]

"}}}
 
Bundle 'finbarrocallaghan/highlights.vim'
"{{{=====================================
nmap <silent> <leader>1  :Hi 1<CR>
nmap <silent> <leader>2  :Hi 2<CR>
nmap <silent> <leader>3  :Hi 3<CR>
nmap <silent> <leader>4  :Hi 4<CR>
nmap <silent> <leader>5  :Hi 5<CR>
nmap <silent> <leader>6  :Hi 6<CR>
nmap <silent> <leader>7  :Hi 7<CR>
nmap <silent> <leader>8  :Hi 8<CR>
nmap <silent> <leader>9  :Hi 9<CR>
"}}}
 
Bundle 'vim-scripts/Gundo'
"{{{======================
noremap <F5> :GundoToggle<CR> 
let g:gundo_right = 1
let g:gundo_preview_bottom = 1
let g:gundo_close_on_revert = 1
"}}}
 
Bundle 'jpalardy/vim-slime'
"{{{=======================
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
"}}}
 
Bundle 'jeetsukumaran/vim-buffersaurus'
"{{{==================================
let g:buffersaurus_autodismiss_on_select = 0
"}}}
 
Bundle "maksimr/vim-jsbeautify"
Bundle "einars/js-beautify"
"{{{=======================

"settings in .editorconfig?
 
 
"map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"}}}


Bundle "davidhalter/jedi-vim"
"{{{=========================
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0 
"}}}

Bundle "vim-scripts/Rainbow-Parentheses-Improved"
"{{{=============================================
"}}}

Bundle 'LaTeX-Box-Team/LaTeX-Box'
"{{{=============================================
let g:LatexBox_latexmk_options = '-pvc -pdf -synctex=1'

"}}}


Bundle "kchmck/vim-coffee-script"
Bundle 'vim-scripts/lbdbq'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'gregsexton/MatchTag'
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/git-time-lapse'
Bundle 'vim-scripts/DrawIt'
Bundle 'vim-scripts/matchit.zip' 
Bundle 'mileszs/ack.vim' 
Bundle 'tpope/vim-markdown'
Bundle "mikewest/vimroom"
Bundle "pangloss/vim-javascript"
Bundle 'scrooloose/nerdcommenter' 
Bundle 'jnwhiteh/vim-golang'
"Bundle 'Shougo/neocomplcache'
"Bundle 'Rykka/colorv'
"Bundle 'suan/vim-instant-markdown'
"Bundle 'wincent/Command-T'
"Bundle 'vim-scripts/desert-warm-256'
"Bundle 'kien/ctrlp.vim'
"=================================
filetype plugin indent on
"" }}} 
