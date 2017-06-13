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
      \ "archiveurl", "publisher", "quote", "website"]

    " Find ref names
    for i in range(1, line('$'))
      let line = getline(i)
      let l = matchstrpos(line, 'name="[A-Za-z0-9_]\+"')
      while l[0] !=# ""
        " See :help complete-items. A ref name is not really a variable, but
        " it's quite useful to visually distinguish ref name completions from
        " keywords
        call add(candidates, {'word': l[0][len('name="') : -len('"') - 1], 'kind': 'v'})
        let l = matchstrpos(line, 'name="[A-Za-z0-9_]\+"', l[2])
      endwhile
    endfor

    for m in candidates
      let s = type(m) == v:t_dict ? m['word'] : m
      if s =~ '^' . a:base
        call add(res, m)
      endif
    endfor
    return res
  endif
endfunction
