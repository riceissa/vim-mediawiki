if exists('g:loaded_mediawiki_filetype')
  finish
endif
let g:loaded_mediawiki_filetype = 1

setlocal textwidth=0
setlocal commentstring=<!--%s-->

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= "|setlocal commentstring< textwidth<"
else
  let b:undo_ftplugin = "setlocal commentstring< textwidth<"
endif
