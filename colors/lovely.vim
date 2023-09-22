" Lovely Colorscheme 
"
" - Hex color conversion functions borrowed from the theme 'Desert256'"

hi clear
let g:colors_name = "lovely"

let s:dark = &bg == "dark"
let s:black = "#000000"
let s:background = (s:dark ? "#171421" : "#ffffff")
let s:darkBackground = (s:dark ? "#171421" : "#171421")
" let s:background = (s:dark ? "#0d1117" : "#ffffff")
" let s:background = (s:dark ? "#161d21" : "#ffffff")
let s:lightBackground = (s:dark ? "#292c2e" : "#fdf6e3")
let s:lightBackground2 = (s:dark ? "#2b2b2b" : "#fdf6e3")
let s:lightBackground3 = (s:dark ? "#1a1a1a" : "#fdf6e3")
let s:lightBackground4 = (s:dark ? "#1c1828" : "#fdf6e3")
let s:foreground = (s:dark ? "#b0b0b0" : "#505050")
let s:foreground2 = (s:dark ? "#d0d0d0" : "#505050") 
let s:pink = "#92346b"
let s:comment = (s:dark ? "#8060c0" : "#909090")
let s:white = "#ffffff"
let s:red = "#c13333"
let s:yellow = (s:dark ? "#ffea00" : "#ffbd00")
let s:orange = s:dark ? "#ffb700" : "#ff6e00"
let s:green = "#6dba09"
let s:dark_aqua = "#376970"
let s:blue = (s:dark ? "#1e9dff" : "#0b9fd6")
let s:purple = (s:dark ? "#7656ff" : "#603adb")
let s:line = (s:dark ? "#262633" : "#fde39d")
let s:window = (s:dark ? "#2f343f" : "#ffe8a8")
let s:selection = (s:dark ? "#ffffff" : "#95721d")
let s:foldedFg = "#1fcfb3"
let s:foldedBg = (s:dark ? s:window : s:background)
let s:aqua = s:blue
let s:dark_aqua = "#4a5263"

if !has("gui_running") && &t_Co < 88
  echoerr "lovely: terminal is not supporting 88 or 256 colors (t_Co=" . &t_Co . ")"
  finish
endif

" Returns an approximate grey index for the given grey level
fun! s:grey_number(x)
  if &t_Co == 88
    if a:x < 23
      return 0
    elseif a:x < 69
      return 1
    elseif a:x < 103
      return 2
    elseif a:x < 127
      return 3
    elseif a:x < 150
      return 4
    elseif a:x < 173
      return 5
    elseif a:x < 196
      return 6
    elseif a:x < 219
      return 7
    elseif a:x < 243
      return 8
    else
      return 9
    endif
  else
    if a:x < 14
      return 0
    else
      let l:n = (a:x - 8) / 10
      let l:m = (a:x - 8) % 10
      if l:m < 5
	return l:n
      else
	return l:n + 1
      endif
    endif
  endif
endfun

" Returns the actual grey level represented by the grey index
fun! s:grey_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 46
    elseif a:n == 2
      return 92
    elseif a:n == 3
      return 115
    elseif a:n == 4
      return 139
    elseif a:n == 5
      return 162
    elseif a:n == 6
      return 185
    elseif a:n == 7
      return 208
    elseif a:n == 8
      return 231
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 8 + (a:n * 10)
    endif
  endif
endfun

" Returns the palette index for the given grey index
fun! s:grey_colour(n)
  if &t_Co == 88
    if a:n == 0
      return 16
    elseif a:n == 9
      return 79
    else
      return 79 + a:n
    endif
  else
    if a:n == 0
      return 16
    elseif a:n == 25
      return 231
    else
      return 231 + a:n
    endif
  endif
endfun

" Returns an approximate colour index for the given colour level
fun! s:rgb_number(x)
  if &t_Co == 88
    if a:x < 69
      return 0
    elseif a:x < 172
      return 1
    elseif a:x < 230
      return 2
    else
      return 3
    endif
  else
    if a:x < 75
      return 0
    else
      let l:n = (a:x - 55) / 40
      let l:m = (a:x - 55) % 40
      if l:m < 20
	return l:n
      else
	return l:n + 1
      endif
    endif
  endif
endfun

" Returns the actual colour level for the given colour index
fun! s:rgb_level(n)
  if &t_Co == 88
    if a:n == 0
      return 0
    elseif a:n == 1
      return 139
    elseif a:n == 2
      return 205
    else
      return 255
    endif
  else
    if a:n == 0
      return 0
    else
      return 55 + (a:n * 40)
    endif
  endif
endfun

" Returns the palette index for the given R/G/B colour indices
fun! s:rgb_colour(x, y, z)
  if &t_Co == 88
    return 16 + (a:x * 16) + (a:y * 4) + a:z
  else
    return 16 + (a:x * 36) + (a:y * 6) + a:z
  endif
endfun

" Returns the palette index to approximate the given R/G/B colour levels
fun! s:colour(r, g, b)
  " Get the closest grey
  let l:gx = s:grey_number(a:r)
  let l:gy = s:grey_number(a:g)
  let l:gz = s:grey_number(a:b)

  " Get the closest colour
  let l:x = s:rgb_number(a:r)
  let l:y = s:rgb_number(a:g)
  let l:z = s:rgb_number(a:b)

  if l:gx == l:gy && l:gy == l:gz
    " There are two possibilities
    let l:dgr = s:grey_level(l:gx) - a:r
    let l:dgg = s:grey_level(l:gy) - a:g
    let l:dgb = s:grey_level(l:gz) - a:b
    let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
    let l:dr = s:rgb_level(l:gx) - a:r
    let l:dg = s:rgb_level(l:gy) - a:g
    let l:db = s:rgb_level(l:gz) - a:b
    let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dgrey < l:drgb
      " Use the grey
      return s:grey_colour(l:gx)
    else
      " Use the colour
      return s:rgb_colour(l:x, l:y, l:z)
    endif
  else
    " Only one possibility
    return s:rgb_colour(l:x, l:y, l:z)
  endif
endfun

" Returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
  if a:rgb[0] == "#"
    let r = ("0x" . strpart(a:rgb, 1, 2)) + 0
    let g = ("0x" . strpart(a:rgb, 3, 2)) + 0
    let b = ("0x" . strpart(a:rgb, 5, 2)) + 0

    return s:colour(r, g, b)
  else
    return a:rgb
  endif
endfun

" Sets the highlighting for the given group
fun! s:hi(group, fg, bg, attr)
  exe "hi " . a:group 
	\ . " "
	\ . (!empty(a:fg) ? "guifg=" . a:fg . " ctermfg=" . s:rgb(a:fg) : "")
	\ . " "
	\ . (!empty(a:bg) ? "guibg=" . a:bg . " ctermbg=" . s:rgb(a:bg) : "")
	\ . " "
	\ . (!empty(a:attr) ? "gui=" . a:attr . " cterm=" . a:attr : "") 
endfun

" Vim Highlighting
call s:hi("LineNrAbove", (s:dark ? s:dark_aqua : s:aqua), "", "none")
call s:hi("LineNrBelow", (s:dark ? s:dark_aqua : s:aqua), "", "none")
call s:hi("LineNr", (s:dark ? s:purple : s:aqua), "", "none")
call s:hi("Normal", s:foreground, s:background, "")
call s:hi("Terminal", s:foreground, s:background, "")
" call s:hi("Terminal", s:foreground, "LightGreen", "bold")
" NOTE:  setting highlighting for Normal group sets 'background' to the
" wrong value (when setting from light to dark backround).  When that
" happens and it is not reset after loading this file syncolor.vim is loaded
" and it messes up the highlighting.
let &bg = (s:dark ? "dark" : "light")
call s:hi("NonText", (s:dark ? s:dark_aqua : s:aqua), s:background, "")
call s:hi("SpecialKey", s:blue, "", "")
call s:hi("IncSearch", s:yellow, s:background, "")
call s:hi("Search", s:yellow, s:background, "")
call s:hi("TabLine", s:foreground, s:background, "none")
call s:hi("TabLineSel", s:dark ? s:orange : s:purple, s:background, "")
call s:hi("TabLineFill", s:background, s:background, "")
call s:hi("User4", s:dark ? s:orange : s:black, s:window, "none")
call s:hi("StatusLine", s:dark ? s:orange : s:black, s:window, "bold")
call s:hi("StatusLineNC",  s:window, s:foreground, "")
call s:hi("WinSeparator", s:window, "", "none")
call s:hi("Visual", "", (s:dark ? "#404040" : s:line), "")
call s:hi("Directory", s:blue, "", "")
call s:hi("ModeMsg", s:green, "", "")
call s:hi("MoreMsg", s:green, "", "")
call s:hi("Question", s:green, "", "")
call s:hi("WarningMsg", s:blue, "", "")
call s:hi("MatchParen", s:foreground, s:yellow, "")
call s:hi("Folded", s:foldedFg, s:foldedBg, (s:dark ? "" : "bold"))
call s:hi("FoldColumn", s:foreground, s:background, "")
call s:hi("CursorLine", "", s:line, "none")
call s:hi("CursorLineSign", "", "", "none")
call s:hi("CursorLineNr", (s:dark ? s:purple : s:aqua), "", "none")
call s:hi("CursorColumn", "", s:line, "none")
call s:hi("PMenu", s:foreground, s:lightBackground2, "none")
call s:hi("PMenuSel", (s:dark ? s:orange : s:foreground), (s:dark ? s:lightBackground3 : s:line), "none")
call s:hi("ColorColumn", "", s:line, "none")
call s:hi("SignColumn", "LightGreen", s:background, "")

" Standard Highlighting
call s:hi("Comment", s:comment, "", "")
call s:hi("Todo", s:blue, s:background, "bold")
call s:hi("Title", s:dark ? s:orange : s:purple, "", "bold")
call s:hi("Identifier", s:foreground, "", "none")
call s:hi("Statement", s:purple, "", "bold")
call s:hi("Conditional", s:purple, "", "bold")
call s:hi("Repeat", s:foreground, "", "")
call s:hi("Structure", s:purple, "", "")
call s:hi("Function", s:blue, "", "")
call s:hi("Error", s:red, s:background, "")
call s:hi("Constant", s:purple, "", "")
call s:hi("String", s:green, "", "")
call s:hi("Special", s:foreground, "", "")
call s:hi("PreProc", s:purple, "", "")
call s:hi("Operator", s:aqua, "", "none")
call s:hi("Type", s:blue, "", "none")
call s:hi("Define", s:purple, "", "none")
call s:hi("Include", s:blue, "", "")
call s:hi("QuickFixLine", "", s:background, "bold")
"call s:hi("Ignore", "666666", "", "")

" Vim Highlighting
call s:hi("vimCommand", s:blue, "", "none")

" C Highlighting
call s:hi("cType", s:purple, "", "bold")
call s:hi("cStorageClass", s:purple, "", "")
call s:hi("cRepeat", s:purple, "", "")

" PHP Highlighting
call s:hi("phpVarSelector", s:blue, "", "")
call s:hi("phpKeyword", s:purple, "", "")
call s:hi("phpRepeat", s:purple, "", "")
call s:hi("phpStatement", s:purple, "", "")
call s:hi("phpMemberSelector", s:foreground, "", "")

" Ruby Highlighting
call s:hi("rubySymbol", s:green, "", "")
call s:hi("rubyConstant", s:yellow, "", "")
call s:hi("rubyAttribute", s:blue, "", "")
call s:hi("rubyInclude", s:blue, "", "")
call s:hi("rubyLocalVariableOrMethod", s:yellow, "", "")
call s:hi("rubyCurlyBlock", s:orange, "", "")
call s:hi("rubyStringDelimiter", s:green, "", "")
call s:hi("rubyInterpolationDelimiter", s:yellow, "", "")
call s:hi("rubyRepeat", s:purple, "", "")

" Python Highlighting
call s:hi("pythonInclude", s:purple, "", "")
call s:hi("pythonStatement", s:purple, "", "")
call s:hi("pythonRepeat", s:purple, "", "bold")
call s:hi("pythonBytesEscape", s:purple, "", "bold")
call s:hi("pythonFunction", s:blue, "", "")

" JavaScript Highlighting
call s:hi("javaScriptBraces", s:foreground, "", "")
call s:hi("javaScriptClass", s:purple, "", "bold")
call s:hi("javaScriptFunction", s:purple, "", "bold")
call s:hi("javaScriptRepeat", s:purple, "", "bold")
call s:hi("javaScriptNumber", s:yellow, "", "")
call s:hi("javaScriptMember", s:yellow, "", "")
call s:hi("jsThis", s:purple, "", "")

" CoffeeScript Highlighting
call s:hi("coffeeKeyword", s:yellow, "", "")
call s:hi("coffeeRepeat", s:yellow, "", "")

call s:hi("coffeeParen", s:aqua, "", "")
call s:hi("coffeeParens", s:blue, "", "")
call s:hi("coffeeBracket", s:aqua, "", "")
call s:hi("coffeeBrackets", s:blue, "", "")

call s:hi("coffeeDotAccess", s:aqua, "", "")
call s:hi("coffeeStatement", s:blue, "", "")

" HTML Highlighting
call s:hi("htmlTag", s:purple, "", "")
call s:hi("htmlEndTag", s:purple, "", "")
call s:hi("htmlTagName", s:purple, "", "")
call s:hi("htmlArg", s:purple, "", "")
call s:hi("htmlString", s:foreground, "", "")
call s:hi("htmlScriptTag", s:purple, "", "")

call s:hi("xmlTag", s:purple, "", "bold")
call s:hi("xmlEndTag", s:purple, "", "bold")
call s:hi("xmlTagName", s:purple, "", "bold")
call s:hi("xmlAttrib", s:foreground, "", "")
call s:hi("xmlAttribPunct", s:foreground, "", "")
call s:hi("xmlString", s:foreground, "", "")
call s:hi("xmlEqual", s:foreground, "", "")

" Diff Highlighting
call s:hi("DiffText", s:blue, s:background, "bold")
call s:hi("DiffChange", s:orange, s:background, "")
call s:hi("DiffAdd", s:blue, s:background, "")
call s:hi("diffAdded", s:blue, s:background, "")
call s:hi("DiffDelete", s:orange, s:darkBackground, "none")
call s:hi("DiffFile", s:orange, "", "bold")
call s:hi("DiffNewFile", s:blue, "", "bold")
call s:hi("DiffRemoved", s:pink, "", "")

call s:hi("TelescopeResultsDiffAdd", s:foreground, "", "")
call s:hi("TelescopeResultsDiffDelete", s:foreground, "", "")
call s:hi("TelescopeResultsNewFile", s:foreground, "", "")

" Spell
call s:hi("SpellBad", "", s:background, "")
call s:hi("SpellCap", "", s:background, "")
call s:hi("SpellLocal", "", s:background, "")
call s:hi("SpellRare", "", s:background, "")
hi SpellBad cterm=underline
hi SpellCap cterm=underline

" Main
call s:hi("mailQuoted1", s:blue, "", "")
call s:hi("mailQuoted2", s:blue, "", "")
call s:hi("mailQuoted2", s:purple, "", "")
call s:hi("mailQuoted4", s:blue, "", "")
call s:hi("mailQuoted5", s:purple, "", "")
call s:hi("mailQuoted6", s:blue, "", "")

" Haskell

" experimental:
" call s:hi("hsDelimiter", s:aqua, "", "")
call s:hi("hsOperator", s:blue, "", "")

call s:hi("ConId", "", "", "bold")
call s:hi("hsBoolean", s:blue, "", "bold")
" call s:hi("hsImportModuleName", "", "", "")
call s:hi("hsType", s:blue, "", "bold")
call s:hi("hsForall", s:purple, "", "bold")
call s:hi("hsDebug", s:orange, "", "")

" Cabal
call s:hi("cabalAuthor", s:blue, "", "")
call s:hi("cabalMaintainer", s:blue, "", "")
call s:hi("cabalLicense", s:blue, "", "bold")
call s:hi("cabalLicenseFile", s:blue, "", "bold")
call s:hi("cabalBuildType", s:purple, "", "")

" AnsiEsc
call s:hi("ansiRed", s:red, s:background, "")
call s:hi("ansiGreen", s:green, s:background, "")
call s:hi("ansiYellow", s:yellow, s:background, "")
call s:hi("ansiBlue", s:blue, s:background, "")
call s:hi("ansiCyan", s:aqua, s:background, "")

" hp files
call s:hi("hpName", s:green, s:background, "")

" markdows
call s:hi("markdownCode", s:aqua, s:background, "")
call s:hi("markdownCodeBlock", s:aqua, s:background, "")

" Syntastic
hi link SyntasticWarning Normal

" ssh-tree-view
hi link SshFileType Title

" lsp signs
call s:hi("LspErrorText", s:red, s:lightBackground4, "")
call s:hi("LspWarningText", s:blue, s:lightBackground4, "")
call s:hi("LspInformationText", "LightGreen", s:lightBackground4, "")
call s:hi("LspHintText", "LightGreen", s:lightBackground4, "")
call s:hi("LspCodeActionText", "LightGreen", s:lightBackground4, "")

hi DiagnosticWarn guifg=#c16815
hi DiagnosticUnderlineWarn gui=undercurl guisp=#ad8530
hi DiagnosticError guifg=#ad4730 
hi DiagnosticUnderlineError gui=undercurl guisp=#ad4730 
hi DiagnosticInfo guifg=#305ead
hi DiagnosticUnderlineInfo gui=undercurl guisp=#305ead
hi DiagnosticHint guifg=DarkGray
hi DiagnosticUnderlineHint gui=undercurl guisp=#c16815
hi DiagnosticUnnecessary gui=undercurl guisp=#c16815

call s:hi("CocWarningHighlight", "", s:lightBackground, "")
call s:hi("CocInfoHighlight", "", s:lightBackground, "")
call s:hi("CocErrorHighlight", "", s:lightBackground, "")
call s:hi("CocHintHighlight", "", s:lightBackground, "")
hi link CocHoverRange Title
hi link CocCursorRange Title

if has('nvim')
hi link TermCursor Cursor
call s:hi("TermCursorNC", s:dark ? "#505050" : "#909090", s:dark ? "#505050" : "#909090", "")
endif
