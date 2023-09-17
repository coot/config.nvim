setl sw=2 sts=2
setl sua=.purs,.js
" otherwise pupl -w does not update
setl bkc=yes
setl include=^import
setl includeexpr=printf('%s.purs',substitute(v:fname,'\\.','/','g'))

nm <buffer> <silent> <leader>t :<C-U>call PSCIDEtype(PSCIDEgetKeyword(), v:true)<CR>
nm <buffer> <silent> <leader>T :<C-U>call PSCIDEaddTypeAnnotation(matchstr(getline(line(".")), '^\s*\zs\k\+\ze'))<CR>
nm <buffer> <silent> <leader>s :<C-U>call PSCIDEapplySuggestion()<CR>
nm <buffer> <silent> <leader>a :<C-U>call PSCIDEaddTypeAnnotation()<CR>
nm <buffer> <silent> <leader>i :<C-U>call PSCIDEimportIdentifier(PSCIDEgetKeyword())<CR>
nm <buffer> <silent> <leader>r :<C-U>call PSCIDEload()<CR>
nm <buffer> <silent> <leader>p :<C-U>call PSCIDEpursuit(PSCIDEgetKeyword())<CR>
nm <buffer> <silent> <leader>C :<C-U>call PSCIDEcaseSplit("!")<CR>
nm <buffer> <silent> <leader>f :<C-U>call PSCIDEaddClause("")<CR>
nm <buffer> <silent> <leader>qa :<C-U>call PSCIDEaddImportQualifications()<CR>
nm <buffer> <silent> ]d :<C-U>call PSCIDEgoToDefinition("", PSCIDEgetKeyword())<CR>

fun! CopyType()
  let last = line("$")
  let start = line(".")
  if getline(start) =~ '^||\s*$' || getline(start) !~ '^||'
    while ((getline(start) =~ '^||\s*$' || getline(start) !~ '^||') && start <= last)
      let start += 1
    endwhile
  else
    while (getline(start - 1) !~ '^||\s*$' && start > 0)
      let start -= 1
    endwhile
  endif
  let end = start
  while (getline(end + 1) !~ '^||\s*$' && end <= last)
    let end += 1
  endwhile
  let lines = getline(start, end)
  let type = join(map(lines, { idx, line -> substitute(line, '\v%(^\|\|)(.{-})\s*$', '\1', '') }), "\n")
  let @" = type
  let @* = type
endfun

com! PcopyType :call CopyType()
au FileType qf :nm <buffer> \t :<C-U>PcopyType<CR>

let s:PS = []
fun! InitPureScript()
  let dirs = map(
	\ findfile("psc-package.json", expand("%:p:h") . ";/", -1),
	\ { idx, val -> fnamemodify(val, ":p:h") }
	\ )
  if empty(dirs)
    let dirs = map(
	  \ findfile("bower.json", expand("%:p:h") . ";/", -1),
	  \ { idx, val -> fnamemodify(val, ":p:h") }
	  \ )
    if empty(dirs)
      return
    endif
  endif

  let path = expand("%:p")
  for p in s:PS
    if stridx(path, p[0], 0) == 0
      let &l:path=p[1]
      return
    endif
  endfor

  let dir = dirs[len(dirs) - 1]
  let gp = globpath(dir, "src/**/*.purs", v:true, v:true)
  if empty(gp)
    return
  endif

  let &l:path=join([dir, dir . "/bower_components/**", dir . "/src/**"], ",")
  call add(s:PS, [dir, &l:path])
endfun
call InitPureScript()
