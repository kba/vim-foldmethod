command! 
    \ -nargs=1 
    \ -complete=customlist,foldtext#ListMethods 
    \ FoldText 
    \ call foldtext#SetFoldtext(<f-args>)

if(&foldtext == "")
    FoldText 'SecondLine'
endif
