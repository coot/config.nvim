" STATUS LINE:

fun GitStatus()
  if &filetype == "toggleterm"
    return ""
  endif

  let branch = ""
  let commit = ""
  let tag    = ""
  let clean  = "●"
  let dirty  = ""

  let sign = branch
  let head = systemlist("git rev-parse --abbrev-ref HEAD")[0]
  let status = 1
  if head =~ '^fatal: '
    let head = ""
  else
    let status = empty(system("git status --porcelain --ignore-submodules=dirty 2>/dev/null"))
    let tags   = systemlist("git tag --points-at=HEAD")
    let dir    = fnamemodify(systemlist("git rev-parse --show-toplevel")[0], ":t")

    if !empty(tags)
      let sign = tag
      " find the tag to use
      let filtered = filter(copy(tags),
            \ {idx, tag -> 
              \ tag =~ '\%('.fnameescape(dir).'\)-\d*\(\.\d*\)\+'
            \ })
      " try `${dir}-${versionNumber}` as a tag name
      if !empty(filtered)
        let head = filtered[0]
      else
        let filtered = filter(copy(tags),
              \ {idx, tag -> 
                \ tag =~ '\%('.fnameescape(dir).'\)'
              \ })
      " try `${dir}` as a tag name
        if !empty(filtered)
          let head = filtered[0]
        else
          let head = tags[len(tags) - 1]
        endif
      endif
    endif
  endif
  if head == "HEAD"
    let sign = commit
    let head = systemlist("git rev-parse --short HEAD")[0]
  endif

  if !empty(head)
    return " " . (status ? clean : dirty) . " " . sign . head . " "
  else
    return ""
  endif
endfun

fun SearchForward()
  if v:searchforward
    return ""
  else
    return ""
  endif
endfun

set statusline=%4*%{winnr()}%*\ %<%f\ %4*%m%r%w%q\ %#StatusLineNC#%{GitStatus()}%*%=(%l,%c%V)\ %P\ %{SearchForward()}
" set statusline=%4*%{winnr()}%*\ %<%f\ %4*%m%r%w%y\ %*%=(%l,%c%V)\ %P\ %{SearchForward()}
set laststatus=2
