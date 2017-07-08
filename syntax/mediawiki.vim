if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'mediawiki'
endif

" Regex taken from
" https://github.com/chikamichi/mediawiki.vim/blob/1e76dfc3ba6c0d23fe02cf3d84d83659026ca703/syntax/mediawiki.vim#L191
syn match mediawikiTemplateName contained /{{[^{|}<>\[\]]\+/hs=s+2 contains=@NoSpell

syn match mediawikiURL `\([A-Za-z]\+:\)\?//[^\t'" <>|]\+[A-Za-z0-9/]` contains=@NoSpell
syn region mediawikiTemplate start="{{" end="}}" contains=mediawikiTemplateName
syn region mediawikiRef start="\v\<ref[^>/]*\>?" end="\v(\<\/ref\>|/\>)" contains=@NoSpell,mediawikiTemplateName
syn match mediawikiWikilink "\[\[wikipedia:" contains=@NoSpell

hi def link mediawikiTemplateName Keyword
hi def link mediawikiRef Comment
hi def link mediawikiURL Constant

let b:current_syntax = "mediawiki"
if main_syntax ==# 'mediawiki'
  unlet main_syntax
endif

" vim:set sw=2:
