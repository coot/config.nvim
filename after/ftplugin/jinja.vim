" Html
let b:match_words = '<:>,<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
" Jinja
let b:match_words .= ',{%-\=\s*if\>[^%]*-\=%}:{%-\=\s*elif\>[^%]*-\=%}:{%-\=\s*else\>[^%]*-\=%}:{%-\=\s*endif\>[^%]*-\=%},{%-\=\s*block\>[^%]*-\=%}:{%-\=\s*endblock\>[^%]*-\=%},{%-\=\s*autoescape\>[^%]*-\=%}:{%-\=\s*endautoescape\>[^%]*-\=%}'

source ~/.vim/ftplugin/html.vim  " omni completion
exe 'source' split(globpath(&rtp, 'indent/html.vim'))[0]
imap </ </<c-x><c-o>
