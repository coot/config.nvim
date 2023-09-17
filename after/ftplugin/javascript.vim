setl kmp=
setl sw=2 sts=2
setl fdm=syntax
setl sua=.js,.jsx

if expand('%:e') == 'jsx'
    " using search does not clobber search history, as / and ? do.
    map <silent> ( :call search('React\.createClass', 'b')<cr>
    map <silent> ) :call search('React\.createClass')<cr>
endif

setl def=^\\s*\\(var\\\|let\\\|const\\\|\\k\\+\\s*=\\)\\>
setl et

nmap [[ :call search('\<function\s*\%([a-zA-Z0-9_]\+\s*\)\?(', 'b')<cr>
nmap ]] :call search('\<function\s*\%([a-zA-Z0-9_]\+\s*\)\?(', '')<cr>
