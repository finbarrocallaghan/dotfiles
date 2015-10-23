"lots of of bits taken from various github rc files and elsewhere
"basic structure from github.com/gmarik

set nocompatible

"color ----------------------------------------------------------------------{{{
"
"set

colorscheme candy
set background=dark
set t_Co=256

function! ResetTitle()
    exec "set title t_ts='' t_fs=''"
    exec ":!echo -e '\033kzsh\033\\'\<CR>"
endfunction

if $TERM=='screen-256color'
  autocmd BufEnter * let &titlestring = "[".expand("%:t") ."]"
  exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
  au VimLeave * silent call ResetTitle()
endif

"}}}

"ui -------------------------------------------------------------------------{{{

"set shell=/bin/zsh
set laststatus=2
set fillchars=""
set encoding=utf-8
set synmaxcol=2048
set showcmd
set number
set colorcolumn=81
set lazyredraw
"set winheight=10

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
"set cindent "responsible for some funny indentation issues!  "http://imgur.com/a/OrwNd
set autoindent
set smarttab
set expandtab
set backspace=2
set textwidth=80
filetype plugin indent on

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


match ExtraWhitespace /\s\+\%#\@<!$/
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
nnoremap <leader>dw :call TrimWhiteSpace()<CR>



" Space to toggle folds.
nmap <leader><Space> za
vmap <leader><Space> za


"leader commands
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>v :so ~/.vimrc<CR>
nmap <silent> <leader>p  :set invpaste<CR>:set paste?<CR>
nmap <silent> <leader>n :set nu!<CR>
nmap <silent> <leader>ul :t.\|s/./=/g\|set nohls<cr>
nmap <silent> <leader>n :set nu!<CR>
nmap <silent> <leader>bD :bd<CR>:bn<CR>
nmap <leader>c a<C-X><C-S>
nmap <silent> <leader>l :!tmux send-keys -t bottom 'pdflatex thesis' C-m<CR>


"}}}

""bundles/plugins etc.. -----------------------------------------------------{{{
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"{{{
"=====================
nmap <leader>bi :PluginInstall<CR>
nmap <leader>bu :PluginInstall!<CR>
nmap <leader>bc :PluginClean<CR>
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
        "set colorcolumn=0
        set background=light
        "set fuoptions=background:#00f5f6f6
        set guioptions-=r
        set laststatus=0
        set noruler
        set lines=40
        set columns=80
    endfunction
else
    "Plugin 'Lokaltog/powerline'
    Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    "==============================================================
    set noshowmode
    "let g:airline_powerline_fonts=1
    "let g:airline_theme='finn'
    "let g:Powerline_symbols = 'compatible'
endif




"Plugin 'sjbach/lusty'
"{{{=================
"let g:LustyJugglerShowKeys   = 1
"let g:LustyJugglerAltTabMode = 1
"nmap <silent> <c-b> :LustyJuggler<CR>
"}}}

Plugin 'nathanaelkane/vim-indent-guides'
"{{{=================================
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
hi IndentGuidesEven ctermbg=234
hi IndentGuidesOdd  ctermbg=233
"hi IndentGuidesEven ctermbg=233
"hi IndentGuidesOdd  ctermbg=232
"}}}

Plugin 'scrooloose/nerdtree'
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

Plugin 'finbarrocallaghan/highlights.vim'
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

Plugin 'vim-scripts/Gundo'
"{{{======================
noremap <F5> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom = 1
let g:gundo_close_on_revert = 1
"}}}

Plugin 'jpalardy/vim-slime'
"{{{=======================
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
"}}}

Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
"{{{=======================

"settings in .editorconfig?


"map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"}}}

Plugin 'vim-scripts/Rainbow-Parentheses-Improved'
"{{{=============================================
"}}}

Plugin 'LaTeX-Box-Team/LaTeX-Box'
"{{{=============================
"let g:LatexBox_latexmk_options = '-pvc -pdf -synctex=1'
"}}}

Plugin 'Lokaltog/vim-easymotion'
"{{{============================
let g:EasyMotion_leader_key =  '<Space>'
nmap s <Space>w
nmap S <Space>b
"}}}

Plugin 'majutsushi/tagbar'
"{{{======================
nnoremap <F8> :TagbarOpen fj<CR>
"}}}

"Plugin 'ivanov/vim-ipython'
Plugin 'vim-scripts/autoswap.vim'


"Plugin 'techlivezheng/vim-plugin-minibufexpl'
""Plugin 'JessicaKMcIntosh/TagmaBufMgr'
"{{{=============================
"let g:miniBufExplMinSize = 1
"let g:miniBufExplMaxHeight = 1
"let g:miniBufExplMapWindowNavVim = 1
"map <leader>t :MBEToggle<cr>
"noremap <C-L> :MBEbn<cr>
"noremap <C-H> :MBEbp<cr>

"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 "}}}

"Plugin 'bling/vim-bufferline'
""============================
"let g:bufferline_echo=0
"set statusline=%{bufferline#generate_string()}

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-fugitive'
"{{{======================
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gw :Gwrite<CR>
nmap <silent> <leader>ga :Gadd<CR>
nmap <silent> <leader>gci :Gcommit<CR>
nmap <silent> <leader>gl :Glog<CR>
"}}}

"Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe'

"Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/lbdbq'


"Plugin 'gregsexton/MatchTag'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-scripts/git-time-lapse'
Plugin 'vim-scripts/DrawIt'
Plugin 'vim-scripts/matchit.zip'
Plugin 'mileszs/ack.vim'
Plugin 'mikewest/vimroom'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jnwhiteh/vim-golang'
Plugin 'vim-scripts/VisIncr'
"Plugin 'triglav/vim-visual-increment'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'vim-scripts/taglist.vim'
Plugin 'duganchen/vim-soy'

"Plugin 'FredKSchott/CoVim'
Plugin 'guns/xterm-color-table.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'kbairak/TurboMark'

"Plugin 'Rykka/colorv.vim'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'wincent/Command-T'
"Plugin 'vim-scripts/desert-warm-256'
"Plugin 'kien/ctrlp.vim'
"=================================

call vundle#end()
"}}}

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

filetype plugin indent on
