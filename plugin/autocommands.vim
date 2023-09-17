" VIM AUTOCOMMAND GROUPS:

" Create a local group, use expandcmd to expand special characters.
fun! AuLocal(bang, cmd)
  augroup LOCAL
    if a:bang == "!"
      au!
    endif
    exe expandcmd(a:cmd)
  augroup END
endfun
com! -bang -nargs=? -complete=command AuLocal :call AuLocal(<q-bang>, <q-args>)

let g:guibg="#1a1a1a"
fun! SetGuiBg()
  let g:guibg = synIDattr(synIDtrans(hlID("Normal")), "bg")
  if v:option_new != v:option_old
    call system("theme-switch.sh " . v:option_new)
  endif
endfun
augroup VIMRC_SetGuiBg
  au!
  au VimEnter    *          :call SetGuiBg()
  au ColorScheme *          :call SetGuiBg()
  au OptionSet   background :call SetGuiBg()
augroup END

" Set PS1 for shell invoked from Vim
" This is very useful when the shell is invoked with :sh vim command.  Then
" I know that I can use exit to return to vim.
augroup VIMRC_servername
  au!
  au VimEnter * let $VIM_SERVERNAME = v:servername
  au VimEnter * let $EDITOR="svim.sh"
augroup END

if !has('nvim')
  set shell=zsh
endif

augroup VIMRC_ghcid
  au!
  au BufEnter .ghcid setl tw=0
augroup END

augroup VIMRC_fix5496
  au!
  au WinNew * redrawstatus
augroup END

augroup VIMRC_ColorSchemes
  au!
  " I don't like when the concealed stuff has different color. Here is how
  " do I canceal it for all colorschemes.
  au ColorScheme * hi! link Conceal Normal
augroup END

augroup VIMRC_dist
  au!
  au BufRead /**/dist/*          setl noma bufhidden=wipe
  au BufRead /**/dist-newstyle/* setl noma bufhidden=wipe
augroup END

augroup VIMRC_files
  au!
  "au BufWritePost *                   :redraw!
  au BufRead ~/src/vim/src/testdir/*  setl noswapfile
  au FileType help,netrw              setl norelativenumber nospell
  au FileType mail                    setl spell textwidth=72
  au CmdwinEnter *                    setl nonumber norelativenumber
  au BufRead ~/.mutt/aliases          setl tw=0
augroup END

"
" IOG
"

let cardano_haskell_projects =
      \ [ "io-sim/io-sim/src"
      \ , "io-sim/io-sim/test"
      \ , "io-sim/io-classes/src"
      \ , "io-sim/io-classes-mtl/src"
      \ , "io-sim/strict-stm/src"
      \ , "io-sim/si-timers/src"
      \ , "io-sim/si-timers/test"
      \ , "ouroboros-network/docs"
      \ , "ouroboros-network/nix"
      \ , "ouroboros-network/monoidal-synchronisation/src"
      \ , "ouroboros-network/monoidal-synchronisation/test"
      \ , "ouroboros-network/job-pool/src"
      \ , "ouroboros-network/Win32-network/src"
      \ , "ouroboros-network/Win32-network/test"
      \ , "typed-protocols/typed-protocols/src"
      \ , "typed-protocols/typed-protocols-cborg/src"
      \ , "typed-protocols/typed-protocols-stateful/src"
      \ , "typed-protocols/typed-protocols-stateful-cborg/src"
      \ , "typed-protocols/typed-protocols-examples/src"
      \ , "typed-protocols/typed-protocols-examples/test"
      \ , "ouroboros-network/ntp-client/src"
      \ , "ouroboros-network/ntp-client/test"
      \ , "ouroboros-network/network-mux/src"
      \ , "ouroboros-network/network-mux/text"
      \ , "ouroboros-network/network-mux/demo"
      \ , "ouroboros-network/ouroboros-network-api/src"
      \ , "ouroboros-network/ouroboros-network-api/test"
      \ , "ouroboros-network/ouroboros-network-framework/src"
      \ , "ouroboros-network/ouroboros-network-framework/test"
      \ , "ouroboros-network/ouroboros-network-framework/io-tests"
      \ , "ouroboros-network/ouroboros-network-framework/sim-tests"
      \ , "ouroboros-network/ouroboros-network-framework/testlib"
      \ , "ouroboros-network/ouroboros-network-framework/demo"
      \ , "ouroboros-network/ouroboros-network-mock/src"
      \ , "ouroboros-network/ouroboros-network-mock/test"
      \ , "ouroboros-network/ouroboros-network-protocols/src"
      \ , "ouroboros-network/ouroboros-network-protocols/testlib"
      \ , "ouroboros-network/ouroboros-network-protocols/test"
      \ , "ouroboros-network/ouroboros-network-protocols/io-tests"
      \ , "ouroboros-network/ouroboros-network-protocols/sim-tests"
      \ , "ouroboros-network/ouroboros-network-protocols/test-cddl"
      \ , "ouroboros-network/ouroboros-network-testing/src"
      \ , "ouroboros-network/ouroboros-network/src"
      \ , "ouroboros-network/ouroboros-network/protocol-tests"
      \ , "ouroboros-network/ouroboros-network/test"
      \ , "ouroboros-network/ouroboros-network/test-cddl"
      \ , "ouroboros-network/ouroboros-network/demo"
      \ , "ouroboros-network/cardano-ping/src"
      \ , "ouroboros-network/ouroboros-network/wireshark-plugin"
      \ , "ouroboros-network/cardano-client/src"
      \ , "ouroboros-network/ouroboros-node/src"
      \ , "ouroboros-network/ouroboros-node/test"
      \ , "ouroboros-consensus/ouroboros-consensus-cardano/app"
      \ , "ouroboros-consensus/ouroboros-consensus-cardano/bench"
      \ , "ouroboros-consensus/ouroboros-consensus-cardano/changelog.d"
      \ , "ouroboros-consensus/ouroboros-consensus-cardano/golden"
      \ , "ouroboros-consensus/ouroboros-consensus-cardano/src"
      \ , "ouroboros-consensus/ouroboros-consensus-cardano/test"
      \ , "ouroboros-consensus/ouroboros-consensus-diffusion/changelog.d"
      \ , "ouroboros-consensus/ouroboros-consensus-diffusion/src"
      \ , "ouroboros-consensus/ouroboros-consensus-diffusion/test"
      \ , "ouroboros-consensus/ouroboros-consensus-protocol/changelog.d"
      \ , "ouroboros-consensus/ouroboros-consensus-protocol/src"
      \ , "ouroboros-consensus/ouroboros-consensus/bench"
      \ , "ouroboros-consensus/ouroboros-consensus/changelog.d"
      \ , "ouroboros-consensus/ouroboros-consensus/src"
      \ , "ouroboros-consensus/ouroboros-consensus/test"
      \ , 'cardano-base/binary/src'
      \ , 'cardano-base/binary/test'
      \ , 'cardano-base/cardano-crypto-class/src'
      \ , 'cardano-base/cardano-crypto-class/test'
      \ , 'cardano-base/slotting/src'
      \ , 'cardano-prelude/src'
      \ , 'cardano-prelude/test'
      \ , 'cardano-crypto/src'
      \ , 'cardano-crypto/test'
      \ , 'cardano-ledger/cardano-ledger/src'
      \ , 'cardano-ledger/cardano-ledger/test'
      \ , 'cardano-ledger/alonzo'
      \ , 'cardano-ledger/byron'
      \ , 'cardano-ledger/libs/cardano-ledger-core'
      \ , 'cardano-ledger/libs/cardano-ledger-example-shelley'
      \ , 'cardano-ledger/libs/cardano-ledger-pretty'
      \ , 'cardano-ledger/libs/cardano-ledger-test'
      \ , 'cardano-ledger/libs/cardano-protocol-tpraos'
      \ , 'cardano-ledger/libs/compat-map'
      \ , 'cardano-ledger/libs/ledger-state'
      \ , 'cardano-ledger/libs/non-integral'
      \ , 'cardano-ledger/libs/plutus-preprocessor'
      \ , 'cardano-ledger/libs/small-steps'
      \ , 'cardano-ledger/libs/small-steps-test'
      \ , 'cardano-ledger-specs/byron'
      \ , 'cardano-ledger-specs/semantics'
      \ , 'cardano-ledger-specs/shelley'
      \ , 'cardano-byron-proxy/src'
      \ , 'cardano-node/doc'
      \ , 'cardano-node/nix'
      \ , 'cardano-api/cardano-api/src'
      \ , 'cardano-api/cardano-api/internal'
      \ , 'cardano-api/cardano-api/test'
      \ , 'cardano-cli/cardano-cli/app'
      \ , 'cardano-cli/cardano-cli/src'
      \ , 'cardano-cli/cardano-cli/test'
      \ , 'cardano-node/cardano-client-demo'
      \ , 'cardano-node/cardano-node-chairman/app'
      \ , 'cardano-node/cardano-node-chairman/test'
      \ , 'cardano-node/cardano-node-chairman/testnet'
      \ , 'cardano-node/cardano-node/src'
      \ , 'cardano-node/cardano-node/test'
      \ , 'cardano-node/cardano-testnet/src'
      \ , 'cardano-node/cardano-testnet/test'
      \ , 'cardano-node/cardano-testnet/testnet'
      \ , 'cardano-node/cardano-tracer/app'
      \ , 'cardano-node/cardano-tracer/bench'
      \ , 'cardano-node/cardano-tracer/configuration'
      \ , 'cardano-node/cardano-tracer/demo'
      \ , 'cardano-node/cardano-tracer/docs'
      \ , 'cardano-node/cardano-tracer/src'
      \ , 'cardano-node/cardano-tracer/test'
      \ , 'cardano-node/trace-dispatcher/src'
      \ , 'cardano-node/trace-dispatcher/test'
      \ , 'cardano-node/trace-forward/src'
      \ , 'cardano-node/trace-forward/test'
      \ , 'cardano-node/trace-resources/src'
      \ , 'cardano-node/trace-resources/test'
      \ , 'cardano-node/bench/cardano-topology/'
      \ , 'cardano-node/bench/locli/src'
      \ , 'cardano-node/bench/locli/app'
      \ , 'cardano-node/bench/process/src'
      \ , 'cardano-node/bench/process/app'
      \ , 'cardano-node/bench/trace-analyser/src'
      \ , 'cardano-node/bench/tx-generator/src'
      \ , 'cardano-node/bench/tx-generator/app'
      \ , 'cardano-node/bench/tx-generator/test'
      \ , 'iohk-monitoring-framework/contra-tracer/src'
      \ , 'iohk-monitoring-framework/iohk-monitoring/src'
      \ , 'iohk-monitoring-framework/iohk-monitoring/test'
      \ , 'iohk-monitoring-framework/plugins'
      \ , 'cardano-sl-x509/src'
      \ , 'cardano-sl-x509/test'
      \ , 'cardano-db-sync/cardano-db-gen/src'
      \ , 'cardano-db-sync/cardano-db-sync-extended/src'
      \ , 'cardano-db-sync/cardano-db-sync-extended/test'
      \ , 'cardano-db-sync/cardano-db-sync/src'
      \ , 'cardano-db-sync/cardano-db-sync/test'
      \ , 'cardano-db-sync/cardano-db-tool/app'
      \ , 'cardano-db-sync/cardano-db-tool/src'
      \ , 'cardano-db-sync/cardano-db/src'
      \ , 'cardano-db-sync/cardano-db/test'
      \ , 'cardano-db-sync/cardano-sync/src'
      \ , 'cardano-rest/explorer-api/src'
      \ , 'cardano-rest/explorer-api/test'
      \ , 'cardano-shell/cardano-launcher/src'
      \ , 'cardano-shell/cardano-launcher/test'
      \ , 'cardano-shell/cardano-shell/src'
      \ , 'cardano-shell/cardano-shell/test'
      \ , 'cardano-wallet/lib'
      \ , 'cardano-wallet/test'
      \ , 'goblins/src'
      \ , 'goblins/test'
      \ ]

fun s:SetPath(dir)
  let cardano_haskell_path = expand("$HOME/clients/iog")
  let ouroboros_network_path = cardano_haskell_path . "/ouroboros-network"
  let g:dir = a:dir
  let g:ouroboros_network_path = ouroboros_network_path

  let dir = substitute(a:dir, '/$', '', '')
  if dir == cardano_haskell_path
    let &path = join(map(copy(g:cardano_haskell_projects),
          \ {idx, dir -> cardano_haskell_path . "/" . dir . "/**"})
          \ , ",")
  elseif stridx(dir, cardano_haskell_path) == 0
    let project = fnamemodify(dir, ":t")
    let path =
          \  join(map(filter( copy(g:cardano_haskell_projects)
          \                 , {idx, val -> stridx(val, project) == 0})
          \          , {key, val -> cardano_haskell_path . "/" . val . "/**"}) 
          \      , ",")
    if !empty(path)
      let &path=path
    endif
  endif
endfun

augroup VIMRC_iohk
  au!
  au BufRead $HOME/clients/iog/**/*.hs setl tw=80
  au VimEnter   *
        \ if stridx(fnamemodify(getcwd(), ":p"), expand("$HOME/clients/iog/")) == 0 |
        \ let $BROWSER="firefox -P iog" |
        \ endif
  au DirChanged *
        \ if stridx(fnamemodify(expand("<afile>"), ":p"), expand("$HOME/clients/iog/")) == 0 |
        \ let $BROWSER="firefox -P iog" | 
        \ endif
  au DirChanged * call s:SetPath(fnamemodify(expand("<afile>"), ":p"))
  au VimEnter   * call s:SetPath(fnamemodify(expand("<afile>"), ":p"))
  au BufEnter   * call s:SetPath(getcwd())
augroup END

silent! augroup VIMRC_DelCommands
  au!
  au VimEnter * if exists(":Sexplore")                == 2 | delcommand Sexplore              | endif
  au VimEnter * if exists(":RecoverPluginEnable")     == 2 | delcommand RecoverPluginEnable   | endif
  au VimEnter * if exists(":RecoverPluginDisable")    == 2 | delcommand RecoverPluginDisable  | endif
  au VimEnter * if exists(":RemoteInsert")            == 2 | delcommand RemoteInsert          | endif
  au VimEnter * if exists(":RemoteOpen")              == 2 | delcommand RemoteOpen            | endif
  au VimEnter * if exists(":ReplaceQuotedSpaces")     == 2 | delcommand ReplaceQuotedSpaces   | endif
  au VimEnter * if exists(":Calendar")                == 2 | delcommand Calendar              | endif

  "Note: maps have to be deleted using execute command (:help exe).
  au VimEnter *       if maparg('\swp')               != ""   | exe "unmap \\swp"             | endif
  au VimEnter *.tex   if maparg("K")                  != ""   | exe "unmap K"                 | endif
  au VimEnter *       if maparg('<C-d>', 'c')         != ""   | exe "cunmap <C-d>"            | endif
  " au VimEnter *     if maparg('<C-F>', 'c')         != ""   | exe "cunmap <C-F>"            | endif
  au VimEnter *       if maparg('\cal')               != ""   | exe "unmap <Leader>cal"       | endif
  au VimEnter *       if maparg('\caL')               != ""   | exe "unmap <Leader>caL"       | endif
  au VimEnter *       if maparg('\rwp')               != ""   | exe "unmap <Leader>rwp"       | endif
  au VimEnter *       if maparg('\swp')               != ""   | exe "unmap <Leader>swp"       | endif
augroup END

" This is useful for all the color files which doesn't define Users highlight group.
" Note: it should be done before loading colorscheme file.
fun! SetMyDefaultHighlighting(hlgroups,LinkGroup)
  for hlgroup in a:hlgroups
    let hlID        = hlID(hlgroup)
    " if the highlight group attribute 'fg' and 'bg' are -1 or an empty string
    " set the default linik.
    if synIDattr(synIDtrans(hlID), 'bg') =~ '^\%(-1\)\=$' && synIDattr(synIDtrans(hlID), 'fg') =~ '^\%(-1\)\=$'
        execute "hi link ".hlgroup." ".a:LinkGroup
    endif
  endfor
endfun
call SetMyDefaultHighlighting(['User1', 'User2', 'User3', 'User4'], "StatusLine")

augroup HighlightUserGroups
  au!
  au ColorScheme * :call SetMyDefaultHighlighting(['User1', 'User2', 'User3', 'User4'], "StatusLine")
augroup END
