" Configure Neomake
let g:async_make_green_success_prefix = ' ✓ '
let g:async_make_green_failure_prefix = ' ✖ '
let g:async_make_green_default_success_text = 'All tests passed'
let g:async_make_green_use_make_output_on_success = 0
let g:neomake_open_list = 2
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_typescript_checkers = ['tsuquyomi', 'tslint'] " You shouldn't use 'tsc' checker.


let s:spinner_index = 0
let s:active_spinners = 0
" let s:spinner_states = ['┤', '┘', '┴', '└', '├', '┌', '┬', '┐']
" let s:spinner_states = ['┤', '┘', '┴', '└', '├', '┌', '┬', '┐']
" let s:spinner_states = ['←', '↑', '→', '↓']
" let s:spinner_states = ['d', 'q', 'p', 'b']
" let s:spinner_states = ['.', 'o', 'O', '°', 'O', 'o', '.']
" let s:spinner_states = ['■', '□', '▪', '▫', '▪', '□', '■']
" let s:spinner_states = ['|', '/', '--', '\', '|', '/', '--', '\']
let s:spinner_states = ['←', '↖', '↑', '↗', '→', '↘', '↓', '↙']

function! StartSpinner()
    let b:show_spinner = 1
    let s:active_spinners += 1
    if s:active_spinners == 1
        let s:spinner_timer = timer_start(1000 / len(s:spinner_states), 'SpinSpinner', {'repeat': -1})
    endif
endfunction

function! StopSpinner()
    let b:show_spinner = 0
    let s:active_spinners -= 1
    if s:active_spinners == 0
        :call timer_stop(s:spinner_timer)
    endif
endfunction

function! SpinSpinner(timer)
    let s:spinner_index = float2nr(fmod(s:spinner_index + 1, len(s:spinner_states)))
    redraw
endfunction

function! SpinnerText()
    if get(b:, 'show_spinner', 0) == 0
        return " "
    endif

    return s:spinner_states[s:spinner_index]
endfunction

augroup neomake_hooks
    au!
    autocmd User NeomakeJobInit :call StartSpinner()
    autocmd User NeomakeJobInit :echom "Build started"
    autocmd User NeomakeFinished :call StopSpinner()
    autocmd User NeomakeFinished :echom "Build complete"
augroup END
