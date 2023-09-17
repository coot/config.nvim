setl isident+=. 
setl kmp=
setl tw=0
let &l:define='^\C\s*'
let &l:include='\C\<import\>'
if len(maparg('<Nul>', 'i'))
    " jedi defined this map, it maps to <c-@> which is a nice vim command
    iunmap <Nul>
endif
" let &l:statusline='%<%f %(%h%m%r %)%{StatusL()}  %#User2#%{PyScope()}%#StatusLine#%= %{fugitive#head(1)} %*%-12.16(%l,%c%V%)%P'

function! ShowPydoc(what)
  let bufname = a:what . ".pydoc"
  " check if the buffer exists already
  if bufexists(bufname)
    let winnr = bufwinnr(bufname)
    if winnr != -1
      " if the buffer is already displayed, switch to that window
      execute winnr . "wincmd w"
    else
      " otherwise, open the buffer in a split
      execute "sbuffer " . bufname
    endif
  else
    " create a new buffer, set the nofile buftype and don't display it in the
    " buffer list
    execute "12split " . bufname
    setlocal buftype=nofile
    setlocal nobuflisted
    " read the output from pydoc
    execute "r!pydoc " . shellescape(a:what)
  endif
  " go to the first line of the document
  1
endfunction
" command! -nargs=1 Pyhelp :call ShowPydoc(<f-args>)
" map <buffer> K :let save_isk = &iskeyword \|
    " \ set iskeyword+=. \|
    " \ execute "Pyhelp " . expand("<cword>") \|
    " \ let &iskeyword = save_isk<CR>

function! PyPrint(what)
python << EOF
import vim

try:
    exec("print(%s)" % vim.eval("a:what"))
except NameError as e:
    print(e)
EOF
endfunction
command! -nargs=1 PyPrint :call Pyprint(<q-args>)

fun! PyScope()
python << EOF
import vim
import re
import json

buf = vim.current.buffer
cpos = vim.current.window.cursor
vim.command("let g:cpos=[%d, %d]" % cpos)

func_pat = re.compile(r'\s*def\s+([^\(]+)\s*\(')
class_pat = re.compile(r'\s*class\s+([^\(]+)\s*\(')
func_name = ''
func_test = False
class_name = ''
for x in range(cpos[0]-1,0,-1):
    line = buf[x]
    func_m =  re.match(func_pat, line)
    class_m = re.match(class_pat, line)

    if func_m and not func_test:
	func_name = func_m.group(1)
	func_test = True
    elif class_m:
	class_name = class_m.group(1)
	break
vim.command("let func_name=%s" % json.dumps(func_name))
vim.command("let class_name=%s" % json.dumps(class_name))
EOF
if !empty(class_name) && !empty(func_name)
    return class_name.".".func_name."()"
elseif !empty(class_name)
    return class_name
elseif !empty(func_name)
    return func_name."()"
else
    return ''
endif
endfun

fun! Python_jump(pat, flag, count)
    normal! m`
    for x in range(a:count)
	call search(a:pat, a:flag)
    endfor
endfun
nnoremap <silent> <buffer> ]] :<C-U>call Python_jump('^\s*\zs\(def\\|class\)\>', 'W', v:count1)<cr>
nnoremap <silent> <buffer> [[ :<C-U>call Python_jump('^\s*\zs\(def\\|class\)\>', 'bW', v:count1)<cr>
nnoremap <silent> <buffer> ]} :<C-U>call Python_jump('^\(def\\|class\)\>', 'W', v:count1)<cr>
nnoremap <silent> <buffer> [{ :<C-U>call Python_jump('^\(def\\|class\)\>', 'bW', v:count1)<cr>
