if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'mediawiki'
endif

syn keyword mediawikiKeyword accessdate date title url archivedate archiveurl
syn keyword mediawikiKeyword cite ref rp
syn region mediawikiRef start="\v\<ref[^>/]*\>?" end="\v(\<\/ref\>|/\>)" contains=@NoSpell

hi def link mediawikiKeyword Keyword
hi def link mediawikiRef Comment

let b:current_syntax = "mediawiki"
if main_syntax ==# 'mediawiki'
  unlet main_syntax
endif

" vim:set sw=2:
