" Configure Neomake
" autocmd! BufWritePost,BufReadPost * Neomake
" autocmd BufWritePre *.js Neoformat
set completeopt=longest,menuone,preview
" let g:neomake_javascript_enabled_makers = ['eslint']
let g:ale_sign_warning='⚠'
let g:ale_sign_error='✖'
" let g:ale_sign_error='x'
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

let g:flow#enable=0
let g:tsuquyomi_disable_quickfix = 1
let g:neomake_jsx_enabled_makers = ['eslint']
let g:ale_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_checkers = ['tsuquyomi', 'tslint'] " You shouldn't use 'tsc' checker.
let g:ale_linters = {'javascript': ['eslint'] }
" Prevent vim-json from concealing quotes
" let g:vim_json_syntax_conceal = 0

" Configure Vim Pencil
" let g:pencil#wrapModeDefault = 'soft'

" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
"   autocmd FileType text call pencil#init()
" augroup END

" Ignore spell checking for camelcased items
" Borrowed from: https://github.com/teranex/dotvim/blob/master/vimrc#L486
autocmd Syntax * syn match CamelCase
  \ "\(\<\|_\)\%(\u\l*\)\{2,}\(\>\|_\)\|\<\%(\l\l*\)\%(\u\l*\)\{1,}\>" transparent
  \ containedin=.*Comment.*,.*String.*,VimwikiLink contains=@NoSpell contained

" Set the filetypes for extensions Vim doesn't recognize by default
autocmd BufRead,BufNewFile *.njs set filetype=jinja

" Always use two spaces for tabs
set tabstop=2 shiftwidth=2 expandtab

" When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting
" purposes.
let g:is_posix = 1


let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

" deoplete

let g:deoplete#enable_at_startup = 1

" neosnippet

let g:neosnippet#enable_completed_snippet = 1
