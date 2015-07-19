let s:save_cpo = &cpo
set cpo&vim

let s:unite_source = {
            \ 'name': 'foldtext',
            \ 'hooks': {},
            \ 'action_table': {'*': {}},
            \ }

function! s:unite_source.gather_candidates(args, context)
    let candidates = []
    for method in foldtext#ListMethods()
        let candidate = {
                    \ 'source': 'foldtext',
                    \ 'kind': ['command']
                    \ }
        let candidate['word'] = printf("%s -- %s", method, foldtext#GetDescription(method))
        let candidate['action__command'] = foldtext#SetFoldtext(method)
        let candidates = add(candidates, candidate)
    endfor
    return candidates
endfunction

function! unite#sources#foldtext#define()
    return s:unite_source
endfunction


"unlet s:unite_source

let &cpo = s:save_cpo
unlet s:save_cpo
