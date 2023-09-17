set omnifunc=htmlcomplete#CompleteTags
setl indentkeys+=>
let g:uppercase_tag = 0
setl kmp=
setl sw=2 sts=-1 fdl=1 tw=0

fun! HtmlOmniCompl(findstart, base)
    " Change default completion htmlcoplete#CompleteTags
    " make tags lowercase
    " add xmlcomplete#GetLastOpenTag when completing a closing tag
    if a:findstart
	let compl_begin = col('.') - 2
	let b:__compl_context = getline('.')[0:(compl_begin)]
	return htmlcomplete#CompleteTags(a:findstart, a:base)
    else
	let final_menu = htmlcomplete#CompleteTags(a:findstart, a:base)
	    for item in final_menu
		if type(item) == 4
		    " lowercase tags
		    let item['word'] = tolower(item['word'])
		endif
	    endfor
	endif
	if empty(final_menu) && b:__compl_context =~ '\/'
	    let opentag = xmlcomplete#GetLastOpenTag("b:unaryTagsStack")
	    if opentag =~ a:base
		call add(final_menu, opentag.">")
	    endif
	endif
	unlet! b:__compl_context
	return final_menu
    endif
endfun
