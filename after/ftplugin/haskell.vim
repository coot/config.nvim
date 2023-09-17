let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
let hs_highlight_debug = 1
let hs_highlight_boolean = 1

setl noexpandtab
setl tw=0
setl et
if strridx(expand("%:p"), "/home/coot/clients/iohk/cardano-haskell/ouroboros-network/ouroboros-consensus", 0) >= 0
  setl sw=2
  let b:haskell_indent_where = 2
  let b:haskell_indent_min = 2
elseif strridx(expand("%:p"), "/home/coot/clients/iohk/cardano-haskell/ouroboros-network/ouroboros-network", 0) >= 0
  setl sw=2
  let b:haskell_indent_where = 2
  let b:haskell_indent_min = 4
elseif strridx(expand("%:p"), "/home/coot/clients/iohk/cardano-haskell/typed-protocols", 0) >= 0
  setl sw=2
  let b:haskell_indent_where = 2
  let b:haskell_indent_min = 4
elseif strridx(expand("%:p"), "/home/coot/clients/iohk/cardano-haskell/io-sim", 0) >= 0
  setl sw=2
  let b:haskell_indent_where = 2
  let b:haskell_indent_min = 4
elseif strridx(expand("%:p"), "/home/coot/clients/iohk/cardano-haskell", 0) >= 0
  setl sw=2
  let b:haskell_indent_where = 2
  let b:haskell_indent_min = 2
elseif strridx(expand("%:p"), "/home/coot/respos/haskell/free-algebras/", 0) >= 0
  setl sw=4
  let b:haskell_indent_where = 2
  let b:haskell_indent_min = 2
else
  setl sw=2
  let b:haskell_indent_where = 2
  let b:haskell_indent_min = 4
endif
let b:haskell_indent_curly = 1

let hs_highlight_rec = v:true
  
setl sts=-1
setl sua=.hs
setl include=^import
setl includeexpr=printf('%s.hs',substitute(v:fname,'\\.','/','g'))
setl formatprg=stylish-haskell
setl isk-='

let b:match_words = '\\\?(:),{:},[:]'

" sort import list in
" import Data.List
"   ( foldl
"   , length
"   , map
"   )
com! -buffer SortImportTerms :?^\s*(?,/^\s*)$/-sort /^[(,[:space:]]*/

setl errorformat=%E%f:%l:%c:\ %trror:,%Z\ %*[\ ]•%m,%tarning:\ %m,%A%m
setl spell
