" STATUS LINE:

let s:gitStatus = 0
fun! UpdateGitStatus()
  try
    let s:gitStatus = empty(system("git status --porcelain --ignore-submodules=dirty 2>/dev/null | tail -n1"))
  catch /.*/
    echomsg v:errmsg
  endtry
endfun

augroup VIMRC_gitStatus
  au!
  au BufRead              * call UpdateGitStatus()
  au WinEnter             * call UpdateGitStatus()
  au BufWritePost         * call UpdateGitStatus()
  au FileChangedShellPost * call UpdateGitStatus()
  " au FocusGained        * call UpdateGitStatus()
  au ShellCmdPost         * call UpdateGitStatus()
  au ShellFilterPost      * call UpdateGitStatus()
augroup END

fun Head()
  if &filetype == "toggleterm"
    return ""
  endif
  " let file = expand("%:p")
  " if file =~ '^fugitive:\/\/'
  "   let head = matchlist(file, '\.git\/\/\?\zs[^\/]\{-}\ze\/')[0]
  "   let tags = systemlist("git tag --points-at=" . head)
  "   if len(tags) > 0
  "     let filtered = filter(tags, {idx, tag -> tag =~ 'ouroboros-network-\d*\(\.\d*\)\+'})
  "     if len(filtered) > 0
  "       let head = filtered[0]
  "     else
  "       let head = tags[len(tags) - 1]
  "     endif
  "   endif
  " else
  "   let head = systemlist("git rev-parse --abbrev-ref HEAD")[0]
  "   if head == "HEAD"
  "     let head = systemlist("git rev-parse --short HEAD")[0]
  "   endif
  " endif
  let head = systemlist("git rev-parse --abbrev-ref HEAD")[0]
  if head == "HEAD"
    let head = systemlist("git rev-parse --short HEAD")[0]
  endif

  " Causes ^E and ^Y to be placed on the screen when scrolling with them
  " so we are caching the values, and refreshing them in VIMRC_gitStatus
  " autocmd group.
  return (s:gitStatus ? "" : "● ") . "\ue0a0" . head
endfun

fun SearchForward()
  if v:searchforward
    return "[/]"
  else
    return "[?]"
  endif
endfun
hi GitStatusLine guifg=LightGreen guibg=#242f36 gui=bold cterm=bold

set statusline=%4*%{winnr()}%*\ %<%f\ %4*%m%r%w%y\ %#StatusLineNC#\ %{Head()}\ %*%=(%l,%c%V)\ %P\ %{SearchForward()}
" set statusline=%4*%{winnr()}%*\ %<%f\ %4*%m%r%w%y\ %*%=(%l,%c%V)\ %P\ %{SearchForward()}
set laststatus=2
