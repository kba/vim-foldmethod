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

function foldtext#GetFoldtextCommand(method)
    return printf("set foldtext=%s()", foldtext#GetFoldtextFunc(a:method))
endfunction

function! foldtext#SetFoldtext(method)
    " echo 'execute ' . foldtext#GetFoldtextCommand(a:method)
    " echo 'foldset before ' . &foldtext
    execute foldtext#GetFoldtextCommand(a:method)
    " echo 'foldset after ' . &foldtext
endfunction

function! foldtext#GetFoldtextFunc(method)
    return printf("foldtext#%s#foldtext" ,a:method)
endfunction

function! foldtext#GetDescriptionFunc(method)
    return printf("foldtext#%s#description", a:method)
endfunction

function! foldtext#GetDescription(method)
    return eval(printf("%s()", foldtext#GetDescriptionFunc(a:method)))
endfunction

function! foldtext#ListMethods(...)
    return keys(s:foldtextMethods)
endfunction
