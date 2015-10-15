set background=dark
hi clear

if exists("syntax_on")
   syntax reset
endif

let colors_name = "candy"

hi VertSplit        ctermfg=233
hi Folded           ctermbg=NONE  ctermfg=9
hi FoldColumn       ctermbg=NONE  ctermfg=9
hi CursorLine       ctermbg=234
hi SpellBad         ctermbg=7     ctermfg=1
hi Search           ctermbg=12    ctermfg=15
hi WildMenu         ctermbg=12    ctermfg=15
hi Pmenu            ctermbg=0     ctermfg=6
hi PmenuSel         cterm=bold    ctermfg=3
hi PmenuSbar        ctermbg=6
hi PmenuThumb       ctermfg=3
hi Tabline          cterm=reverse,bold ctermfg=NONE ctermbg=NONE
hi MatchParen       ctermbg=4
hi LineNr           ctermfg=240
hi CursorLineNr     ctermfg=240
hi ColorColumn      ctermbg=234
hi ExtraWhiteSpace  ctermbg=234
hi trailingWhitespace ctermbg=234

