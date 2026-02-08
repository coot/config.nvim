syn match cddlComment /^\s*;.*/
syn match cddlOperator /[\/=\*]/
syn match cddlOperator /\<\.\.\>/
syn match cddlOperator /\.\(size\|default\|regexp\|bits\|and\|within\|eq\|ne\|lt\|le\|gt\|ge\)\>/

syn keyword cddlType any uint bool byte bytes tstr
syn match cddlNumber /\<\d\+\>/

hi def link cddlComment Comment
hi def link cddlOperator Operator
hi def link cddlNumber Number
hi def link cddlType Type
