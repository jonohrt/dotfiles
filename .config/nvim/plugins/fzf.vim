let g:fzf_quickfix_use_loclist = 1

let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{node_modules,.git/*,build}" -g "!coverage/*"'

let $FZF_DEFAULT_OPTS='--bind ctrl-n:down --layout=reverse'

" Border style (rounded / sharp / horizontal)
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.9, 'highlight': 'Todo', 'border': 'rounded' } }

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = '✠,ctrl-x'

" FZF

nnoremap <leader>[ :GFiles<cr>
nnoremap <leader>o :Files<cr>
nnoremap <leader>p :Buffers<cr>
nnoremap <leader>fa :Rg<space>
nnoremap <leader>fs :Snippets<cr>
nnoremap <leader>fgc :Commits<cr>
nnoremap <leader>fgb :BCommits<cr>
nnoremap <leader>fc :Commands<cr>
nnoremap <leader>] :GFiles?<cr>
nnoremap <leader>fh :History<cr>
nnoremap <leader>f: :History:<cr>
nnoremap <leader>f/ :History/<cr>
nnoremap <leader>fbl :BLines<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>ff :Filetypes<cr>
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fbt :BTags<cr>

nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-b> <plug>(fzf-complete-buffer-line)
