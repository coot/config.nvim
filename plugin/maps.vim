" TODO:
" These maps should be redone in `plugins/maps.lua`

" remove `Y-default`
unmap Y

cno <expr> \h (getcmdtype() == ':' ? (getcmdline()[0:getcmdpos() - 1] =~ ':h/$' ? '<BS>:h' : (getcmdline()[0:getcmdpos() - 1] =~ ':h$' ? ':h' : '%:h')) : '\h')
cno <expr> \l (getcmdtype() == ':' ? (getcmdline()[0:getcmdpos() - 1] =~ ':h/$' ? '<BS>:h/' : (getcmdline()[0:getcmdpos() - 1] =~ ':h$' ? ':h/' : '%:h/')) : '\l')

fun! DefineHighlightCommands()
  com! SynStack :echo map(synstack(line("."), col(".")), 'synIDattr( v:val, "name")')
  com! HighLightGroup :echo synIDattr(synIDtrans(reverse(synstack(line("."), col(".")))[0]), 'name')
  com! HighLightColor :echo "fg=" . synIDattr(synIDtrans(reverse(synstack(line("."), col(".")))[0]), 'fg') . " bg=" . synIDattr(synIDtrans(reverse(synstack(line("."), col(".")))[0]), 'bg')
endfun

fun! Split(vert, range, line1, line2, qarg)
  if a:range == 0
    let height = ""
  elseif a:line2 != a:line1
    let height = a:line2 - a:line1 + 1
  else
    let height = a:line1
  endif
  if a:qarg == "0" || a:qarg == "^"
    let lineNr = 1
  else
    let lineNr = a:qarg
  endif
  if a:vert
    let spr=&spr
    se nospr
    exe height . "vsp"
    if !empty(lineNr)
      exe "normal " . lineNr . "G"
    endif
    let &spr=spr
  else
    let sb=&sb
    se nosb
    exe height . "sp"
    if !empty(lineNr)
      exe "normal " . lineNr . "G"
    endif
    let &sb=sb
  endif
endfun
com! -range -nargs=? Hsplit call Split(v:false, <range>, <line1>, <line2>, <q-args>)
com! -range -nargs=? Vsplit call Split(v:true,  <range>, <line1>, <line2>, <q-args>)
nm <c-w>S :Hsplit<CR>
nm <c-w>V :Vsplit<CR>
