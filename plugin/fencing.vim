if exists('g:fencing_loaded')
    finish
endif

let g:fencing_loaded = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

augroup FencingSetup
    autocmd!
    autocmd FileType * call <sid>Setup()
augroup END

function! s:Setup()
    augroup FencingEnabled
        autocmd! CursorMoved <buffer>
        if !empty(&filetype) && exists('b:fencing_options')
            let b:fencing_default_filetype = &filetype
            let b:fencing_current_filetype = b:fencing_default_filetype
            let b:fencing_options[b:fencing_default_filetype] = {}
            autocmd CursorMoved <buffer> call <SID>UpdateFencing()
        endif
    augroup END
endfunction

function! s:UpdateFencing()
    " Query other plugin for the current context.
    let filetype = context_filetype#get()['filetype']

    " Only set options if the context has changed.
    if filetype != b:fencing_current_filetype
        let b:fencing_current_filetype = filetype

        if has_key(b:fencing_options, filetype)

            let options = b:fencing_options[filetype]
            let default = b:fencing_options[b:fencing_default_filetype]

            for [key, value] in items(options)
                " Record original values for changed options.
                if !has_key(default, key)
                    let default[key] = eval('&' . key)
                endif

                " Finally, set the buffer option.
                execute('setlocal ' . key . '=' . value)
            endfor

        endif
    endif
endfunction

let &cpoptions = s:save_cpoptions
