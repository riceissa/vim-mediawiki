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
      let res = []
      let candidates = ["cite web", "accessdate", "archivedate",
        \ "archiveurl", "publisher"]
      for i in range(1, line('$'))
        let line = getline(i)
        let m = matchstr(line, 'name="[A-Za-z0-9_]\+"')
        if m !=# ""
          call add(candidates, m[len('name="') : -len('"') - 1])
        endif
      endfor
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
