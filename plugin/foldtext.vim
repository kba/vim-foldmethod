"Foldtext Function (terse foldline format string)

set foldtext=FoldtextTerse()
" set foldtext=KbaFoldText()
function! KbaFoldText()
  " setting fold text
  " let nl = v:foldend - v:foldstart + 1
  " let comment = substitute(getline(v:foldstart),"^ *\" *","",1)
  " let linetext = substitute(getline(v:foldstart+1),"^ *","",1)
  return  getline(v:foldstart+1)
endfunction
" a simple replacement for vim's builtin foldtext() function

function! FoldtextTerse()
  let line = getline(v:foldstart)
  " let line = substitute( line, '^[^0-9a-zA-Z]*', '', '' )
  let l:com_str = split( substitute( &commentstring, " ", "", "g" ), "%s" )
  let line = substitute( line, "" . com_str[0] . "\s*", "", "" )
  " if it's a start/end comment
  if len(line) > 1
      let line = substitute( line, "\s*" . com_str[1], "", "" )
  endif
  let l:fmr = split( &foldmarker, "," )
  let line = substitute( line, "\s*"  . fmr[0] . '\d*\s*', '', '' )

  " number of folded lines
  let len  = v:foldend - v:foldstart
  let depth = v:foldlevel
  let depth_str = ">"
  while depth != 1
      let depth = depth - 1
      let depth_str .= ">"
  endwhile
  return  printf("%-5s", depth_str) . printf("%4d", len) . ': ' . line
endfunction
