if exists("hs_highlight_rec")
  syn match hsRec "\<rec\>"
endif
syn match hsForall "\<forall\>"

hi def link hsRec hsStructure
hi def link hsForall hsStructure

" syn keyword cootHsDerivingStrategy stock via anyclass
" hi def link cootHsDerivingStrategy Typedef

syn sync minlines=1000
