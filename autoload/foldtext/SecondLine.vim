function! foldtext#SecondLine#description()
    return 'Fold by second line'
endfunction

function! foldtext#SecondLine#foldtext()
  " setting fold text
  " let nl = v:foldend - v:foldstart + 1
  " let comment = substitute(getline(v:foldstart),"^ *\" *","",1)
  " let linetext = substitute(getline(v:foldstart+1),"^ *","",1)
  return  getline(v:foldstart+1)
endfunction
