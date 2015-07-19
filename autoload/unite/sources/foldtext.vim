let s:save_cpo = &cpo
set cpo&vim

let s:unite_source = {
            \ 'name': 'foldtext',
            \ 'hooks': {},
            \ 'action_table': {'*': {}},
            \ }

" function! s:unite_source.hooks.on_init(args, context)
  " let s:beforefoldtext = get(g:, 'foldtext', 'foldtext()')
" endfunction

" function! s:unite_source.hooks.on_close(args, context)
  " if s:beforefoldtext == g:foldtext
    " return
  " endif
  " execute 'set foldtext=' . s:beforefoldtext
  " echo &foldtext
" endfunction

function! s:unite_source.gather_candidates(args, context)
    let l:candidates = []
    for method in foldtext#ListMethods()
        let l:candidate = {}
        let l:candidate["source"] =  "foldtext"
        let l:candidate["kind"] =  'command'
        let l:candidate['word'] = printf("%s -- %s", method, foldtext#GetDescription(method))
        let l:candidate['action__command'] = "FoldText " . method
        let l:candidate["action__type"] =  ':'
        let l:candidate["action__path"] = method
        let l:candidate["action__directory"] = fnamemodify(method, ":h")
        call add(l:candidates, l:candidate)
    endfor
    " echo l:candidates
    return l:candidates
endfunction

let s:unite_source.action_table['*'].preview = {
            \ 'description' : 'preview this foldtext',
            \ 'is_quit' : 0,
            \ }

function! s:unite_source.action_table['*'].preview.func(candidate)
    windo execute a:candidate.action__command
endfunction


function! unite#sources#foldtext#define()
    return s:unite_source
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
