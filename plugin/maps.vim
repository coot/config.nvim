cno <expr> \h (getcmdtype() == ':' ? (getcmdline()[0:getcmdpos() - 1] =~ ':h/$' ? '<BS>:h' : (getcmdline()[0:getcmdpos() - 1] =~ ':h$' ? ':h' : '%:h')) : '\h')
cno <expr> \l (getcmdtype() == ':' ? (getcmdline()[0:getcmdpos() - 1] =~ ':h/$' ? '<BS>:h/' : (getcmdline()[0:getcmdpos() - 1] =~ ':h$' ? ':h/' : '%:h/')) : '\l')

