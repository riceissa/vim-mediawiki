if has('autocmd')
  autocmd BufNewFile,BufRead *.mediawiki setlocal filetype=mediawiki
  autocmd BufNewFile,BufRead */itsalltext/*wikipedia* setlocal filetype=mediawiki
endif
