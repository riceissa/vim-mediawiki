if exists('g:loaded_mediawiki_filetype')
  finish
endif
let g:loaded_mediawiki_filetype = 1

setlocal textwidth=0
setlocal commentstring=<!--%s-->

if exists("+omnifunc")
  " From :help complete-functions
  fun! CompleteMediawiki(findstart, base)
    if a:findstart
      " locate the start of the word
      let line = getline('.')
      let start = col('.') - 1
      while start > 0 && line[start - 1] =~ '\a'
        let start -= 1
      endwhile
      return start
    else
      " find months matching with "a:base"
      let res = []
      let candidates = ["cite web", "accessdate", "archivedate",
        \ "archiveurl", "publisher"]
      for m in candidates
        if m =~ '^' . a:base
          call add(res, m)
        endif
      endfor
      return res
    endif
  endfun
endif

if exists("+omnifunc")
  setlocal omnifunc=CompleteMediawiki
endif
