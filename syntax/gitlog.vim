"if exists("b:current_syntax")
"  finish
"endif

syn match GitLogCommit "^commit:.*"
syn match GitLogCommit "^\w\{9}\ze \S"
syn match GitLogAuthor "^author:.*"
syn match GitLogFile   "^\s\f*\s*|\s\+\(\d\+\( [+-]*\)\?\|Bin\s\+\d\+\s\+->\s\+\d\+\s\+bytes\)"
syn match GitLogHead   "HEAD@{\d\+}"

hi def link GitLogCommit Title
hi def link GitLogAuthor WarningMsg
hi def link GitLogFile   String
hi def link GitLogHead   LineNr

hi link GitLogFile String


let b:current_syntax = "gitlog"
