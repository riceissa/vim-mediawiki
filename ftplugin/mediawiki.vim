if exists('g:loaded_mediawiki_filetype')
  finish
endif
let g:loaded_mediawiki_filetype = 1

noremap <buffer> j gj
noremap <buffer> k gk
noremap <buffer> gj j
noremap <buffer> gk k
noremap <buffer> 0 g0
noremap <buffer> g0 0
noremap <buffer> ^ g^
noremap <buffer> g^ ^
noremap <buffer> $ g$
noremap <buffer> g$ $
noremap <buffer> D dg$
noremap <buffer> C cg$
noremap <buffer> A g$a

setlocal wrap
setlocal linebreak
setlocal textwidth=0
