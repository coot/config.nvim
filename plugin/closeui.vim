" Close ui, but only if there is a single ui
function CloseUI()
  for ui in nvim_list_uis()
    if ui['chan'] && !ui['stdout_tty']
      call chanclose(ui['chan'])
    endif
  endfor
endfun

" CloseUI without shuting down the server.
" It will close all UIs!
com! CloseUI :call CloseUI()
