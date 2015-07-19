let s:foldtextFiles = split(globpath(&runtimepath, 'autoload/foldtext/*.vim'), '\n')
for f in s:foldtextFiles
    call foldtext#register_foldtext(fnamemodify(f, ":t:r"))
endfor
