" From :help complete-functions
function! mediawiki#mediawikicomplete#Complete(findstart, base)
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
        echom "on line" i "found" m
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
endfunction
