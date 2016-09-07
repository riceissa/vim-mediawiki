if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'mediawiki'
endif

syn match mediawikiKeyword contained "\<\(cite web\|accessdate\|archivedate\|archiveurl\|doi\|journal\|volume\|issue\|quote\|cquote\|website\|arxiv\|jstor\|rp\|publisher\|first1\|last1\|first\|last\|first1\|last2\)\>" contains=@NoSpell
" syn keyword mediawikiKeyword accessdate date title url archivedate archiveurl
" syn keyword mediawikiKeyword cite web ref rp publisher first last first1 last1
" syn keyword mediawikiKeyword first2 last2
syn region mediawikiTemplate start="{{" end="}}" contains=mediawikiKeyword
syn region mediawikiRef start="\v\<ref[^>/]*\>?" end="\v(\<\/ref\>|/\>)" contains=@NoSpell

hi def link mediawikiKeyword Keyword
hi def link mediawikiRef Comment

let b:current_syntax = "mediawiki"
if main_syntax ==# 'mediawiki'
  unlet main_syntax
endif

" vim:set sw=2:
