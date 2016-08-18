if exists('g:loaded_mediawiki_filetype_highlighting')
  finish
endif
let g:loaded_mediawiki_filetype_highlighting = 1

autocmd FileType mediawiki nnoremap <buffer> j gj
autocmd FileType mediawiki nnoremap <buffer> k gk
autocmd FileType mediawiki vnoremap <buffer> j gj
autocmd FileType mediawiki vnoremap <buffer> k gk
autocmd FileType mediawiki nnoremap <buffer> gj j
autocmd FileType mediawiki nnoremap <buffer> gk k
autocmd FileType mediawiki vnoremap <buffer> gj j
autocmd FileType mediawiki vnoremap <buffer> gk k
