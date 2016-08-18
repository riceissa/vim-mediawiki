if exists('g:loaded_mediawiki_filetype_highlighting')
  finish
endif
let g:loaded_mediawiki_filetype_highlighting = 1

nnoremap <buffer> j gj
nnoremap <buffer> k gk
vnoremap <buffer> j gj
vnoremap <buffer> k gk
nnoremap <buffer> gj j
nnoremap <buffer> gk k
vnoremap <buffer> gj j
vnoremap <buffer> gk k
