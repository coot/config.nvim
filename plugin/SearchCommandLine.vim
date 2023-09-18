fun! CmdWord()
  let cmd = getcmdline()
  let v = cmd =~ '^\\v'
  if cmd =~ '^\v(\\[vcC]|\\?\^)*' . (v ? '\<' : '\\\<') . '.*' . (v ? '\>' : '\\\>') .'\s*$'
    return substitute(cmd, '^\v(%(\\[vcC]|\\?\^)*)' . (v ? '\<' : '\\\<') . '(.{-})' . (v ? '\>' : '\\\>') . '\s*$', '\1\2', '')
  else  
    return substitute(cmd, '^\v%(\\[vcC]|\\?\^)*(\zs.*)', (v ? '<\1>' : '\\<\1\\>'), '')
  endif
endfun

fun! ToggleCommand()
    " Based on emacscommand function ToggleExternalCommand
    let l:cmd = getcmdline()
    if l:cmd =~ '^%\=s\%[ubstitute][/!#]'
	if l:cmd[0] == '%'
	    return l:cmd[1:]
	else
	    return '%'.l:cmd
	endif
    endif
    if ('!' == strpart(l:cmd, 0, 1))
        call setcmdpos(getcmdpos() - 1)
        return strpart(l:cmd, 1)
    else
        call setcmdpos(getcmdpos() + 1)
        return '!' . l:cmd
    endif
endfun
cno <expr> <c-z> (getcmdtype() == '/' <bar><bar> getcmdtype() == '?' ? "<C-\>eCmdWord()<CR>" : (getcmdtype() == ":" ? '<C-\>eToggleCommand()<CR>' : "" ) )

fun! ToggleLarge()
  " Toggle \C in `/` or `?` command lines
  let cmd = getcmdline()
  let m = matchlist(cmd, '^\v(\\v)?(\\C)?(.*)')[1:3]
  let ev = empty(m[0])
  let eC = empty(m[1])
  let m[1] = eC ? '\C' : ''
  let pos = getcmdpos()
  if eC
    if pos >= (ev ? 1 : 3)
      call setcmdpos(pos + 2)
    endif
  else
    if pos >= (ev ? 3 : 5)
      call setcmdpos(max([1, pos - 2]))
    endif
  endif
  return join(m, '')
endfun
cno <expr> <c-l> (getcmdtype() == '/' <bar><bar> getcmdtype() == '?' ? "<C-\>eToggleLarge()<CR>" : "")

fun! ToggleVeryMagic()
  " Toggle \C in `/` or `?` command lines
  let cmd = getcmdline()
  let m = matchlist(cmd, '^\v(\\v)?(.*)')[1:2]
  let ev = empty(m[0])
  let m[0] = ev ? '\v' : ''
  let pos = getcmdpos()
  if ev
    call setcmdpos(pos + 2)
  else
    call setcmdpos(max([1, pos - 2]))
  endif
  return join(m, '')
endfun
cno <expr> <c-v> (getcmdtype() == '/' <bar><bar> getcmdtype() == '?' ? "<C-\>eToggleVeryMagic()<CR>" : "")
