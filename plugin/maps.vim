cno <expr> \h (getcmdtype() == ':' ? (getcmdline()[0:getcmdpos() - 1] =~ ':h/$' ? '<BS>:h' : (getcmdline()[0:getcmdpos() - 1] =~ ':h$' ? ':h' : '%:h')) : '\h')
cno <expr> \l (getcmdtype() == ':' ? (getcmdline()[0:getcmdpos() - 1] =~ ':h/$' ? '<BS>:h/' : (getcmdline()[0:getcmdpos() - 1] =~ ':h$' ? ':h/' : '%:h/')) : '\l')

fun! DefineHighlightCommands()
  com! SynStack :echo map(synstack(line("."), col(".")), 'synIDattr( v:val, "name")')
  com! HighLightGroup :echo synIDattr(synIDtrans(reverse(synstack(line("."), col(".")))[0]), 'name')
  com! HighLightColor :echo "fg=" . synIDattr(synIDtrans(reverse(synstack(line("."), col(".")))[0]), 'fg') . " bg=" . synIDattr(synIDtrans(reverse(synstack(line("."), col(".")))[0]), 'bg')
endfun
