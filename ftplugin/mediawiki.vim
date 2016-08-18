if exists('g:loaded_mediawiki_filetype_highlighting')
  finish
endif
let g:loaded_mediawiki_filetype_highlighting = 1

augroup MediaWiki
  autocmd!
  autocmd Syntax mediawiki call mediawiki#PerformHighlighting()
augroup END
