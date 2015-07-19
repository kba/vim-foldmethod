"Foldtext Function (terse foldline format string)
" a simple replacement for vim's builtin foldtext() function

" set foldtext=FoldtextTerse()
" set foldtext=KbaFoldText()

if (!exists('g:foldtext'))
    set foldtext="foldtext#FoldSecondLine"
endif

let s:foldtextMethods = {}

function! foldtext#register_foldtext(method)
    let s:foldtextMethods[a:method] = 1
endfunction

function! foldtext#SetFoldtext(method)
  return printf("setlocal foldtext=foldtext#%s#foldtext()" ,a:method)
endfunction

function! foldtext#GetDescription(method)
    return eval(printf("foldtext#%s#description()", a:method))
endfunction

function! foldtext#ListMethods()
    return keys(s:foldtextMethods)
endfunction
