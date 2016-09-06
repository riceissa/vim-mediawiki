if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'mediawiki'
endif

syn keyword mediawikiKeyword accessdate date title url archivedate archiveurl
syn keyword mediawikiKeyword cite web ref rp publisher first last first1 last1
syn keyword mediawikiKeyword first2 last2
syn region mediawikiRef start="\v\<ref[^>/]*\>?" end="\v(\<\/ref\>|/\>)" contains=@NoSpell

hi def link mediawikiKeyword Type
hi def link mediawikiRef Comment

let b:current_syntax = "mediawiki"
if main_syntax ==# 'mediawiki'
  unlet main_syntax
endif

" vim:set sw=2:
