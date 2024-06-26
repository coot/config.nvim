let s:texMathList=[
  \ ['mpr'		, '⇾'],
  \ ['ir'		, '⇾'],
  \ ['mpl'		, '⇽'],
  \ ['il'		, '⇽'],
  \ ['|'		, '|'],
  \ ['barwedge'	, '⊼'],
  \ ['between'	, '≬'],
  \ ['bigsqcup'	, '⊔'],
  \ ['vee'		, '∨'],
  \ ['wedge'		, '∧'],
  \ ['bigvee'		, '∨'],
  \ ['bigwedge'	, '∧'],
  \ ['blacksquare'	, '∎'],
  \ ['Cap'		, '⋒'],
  \ ['coprod'		, '∐'],
  \ ['Cup'		, '⋓'],
  \ ['curlyvee'	, '⋎'],
  \ ['curlywedge'	, '⋏'],
  \ ['diamond'	, '⋄'],
  \ ['dotplus'	, '∔'],
  \ ['doublebarwedge'	, '⩞'],
  \ ['eqslantgtr'	, '⪖'],
  \ ['eqslantless'	, '⪕'],
  \ ['gtrdot'		, '⋗'],
  \ ['Im'		, 'ℑ'],
  \ ['leftarrow'	, '←'],
  \ ['Leftarrow'	, '⇐'],
  \ ['leftthreetimes'	, '⋋'],
  \ ['ltimes'		, '⋉'],
  \ ['measuredangle'	, '∡'],
  \ ['mid'		, '∣'],
  \ ['nmid'		, '∤'],
  \ ['ntriangleleft'	, '⋪'],
  \ ['ntrianglelefteq', '⋬'],
  \ ['ntriangleright'	, '⋫'],
  \ ['ntrianglerighteq', '⋭'],
  \ ['nvdash'		, '⊬'],
  \ ['nvDash'		, '⊭'],
  \ ['nVdash'		, '⊮'],
  \ ['oint'		, '∮'],
  \ ['pitchfork'	, '⋔'],
  \ ['precapprox'	, '⪷'],
  \ ['preceq'		, '≼'],  
  \ ['preccurlyeq'	, '≼'],  
  \ ['precnapprox'	, '⪹'],
  \ ['precneqq'	, '≺'],
  \ ['Re'		, 'ℜ'],
  \ ['rightarrow'	, '→'],
  \ ['Rightarrow'	, '⇒'],
  \ ['rightthreetimes', '⋌'],
  \ ['rtimes'		, '⋊'],
  \ ['setminus'	, '\'],
  \ ['sphericalangle'	, '∢'],
  \ ['sqcap'		, '⊓'],
  \ ['sqcup'		, '⊔'],
  \ ['Subset'		, '⋐'],
  \ ['subseteqq'	, '⫅'],
  \ ['subsetneqq'	, '⫋'],
  \ ['succapprox'	, '⪸'],
  \ ['succeq'		, '≽'],
  \ ['succcurlyeq'	, '≽'],
  \ ['succnapprox'	, '⪺'],
  \ ['succneqq'	, '≻'],
  \ ['Supset'		, '⋑'],
  \ ['supseteqq'	, '⫆'],
  \ ['supsetneqq'	, '⫌'],
  \ ['triangleleft'	, '⊲'],
  \ ['trianglelefteq'	, '⊴'],
  \ ['triangleright'	, '⊳'],
  \ ['trianglerighteq', '⊵'],
  \ ['vDash'		, '⊨'],
  \ ['Vdash'		, '⊩'],
  \ ['vdots'		, '⋮'],
  \ ['veebar'		, '⊻'],
  \ ['Vvdash'		, '⊪'],
  \ ['wr'		, '≀']]
for texmath in s:texMathList
 if texmath[0] =~ '\w$'
  exe "syn match texMathSymbol '\\\\".texmath[0]."\\>' contained conceal cchar=".texmath[1]
 else
  exe "syn match texMathSymbol '\\\\".texmath[0]."' contained conceal cchar=".texmath[1]
 endif
endfor

syn match texRefZone		'\\citeauthor' nextgroup=texRefOption,texCite
" Support for the subfiles package:
syn match texInputFile		"\\\(epsfig\|input\|usepackage\|subfile\)\s*\(\[.*\]\)\={.\{-}}"		contains=texStatement,texInputCurlies,texInputFileOpt
syn match texInput		"\\input\s\+\f\+"hs=s+7				contains=texStatement

syntax sync maxlines=50 minlines=10
