if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo-=C

setlocal textwidth=0
setlocal commentstring=<!--%s-->

" Matchit options copied from $VIMRUNTIME/ftplugin/html.vim
" HTML:  thanks to Johannes Zellner and Benji Fisher.
if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_words = '<:>,' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif

let b:undo_ftplugin = "setlocal commentstring< textwidth<" .
      \ " | unlet! b:match_ignorecase b:match_words b:match_skip"

let &cpo = s:save_cpo
unlet s:save_cpo
