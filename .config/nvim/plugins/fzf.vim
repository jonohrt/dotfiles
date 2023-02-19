let g:fzf_quickfix_use_loclist = 1

" let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob
" !{node_modules,.git/*,build}" -g !coverage/*"'

" let $FZF_DEFAULT_COMMAND='fd . --follow --hidden --exclude ".git" --exclude "node_modules"'
"
let $FZF_DEFAULT_OPTS='--bind ctrl-n:down --layout=reverse'
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
" Border style (rounded / sharp / horizontal)
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.9, 'highlight': 'Todo', 'border': 'rounded' } }

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = '✠,ctrl-x'
" FZF

nnoremap <leader>ff :Files<cr>
nnoremap <leader>pf :GFiles --cached --others --exclude-standard<cr>
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>sp :Rg<space>
nnoremap <leader>fs :Snippets<cr>
nnoremap <leader>pc :Commits<cr>
nnoremap <leader>bc :BCommits<cr>
nnoremap <leader>fc :Commands<cr>
nnoremap <leader>fh :Help<cr>
nnoremap <leader>] :GFiles?<cr>
nnoremap <leader>f? :History<cr>
nnoremap <leader>f: :History:<cr>
nnoremap <leader>f/ :History/<cr>
nnoremap <leader>fbl :BLines<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fft :Filetypes<cr>
nnoremap <leader>ft :Tags<cr>
nnoremap <leader>fbt :BTags<cr>
nnoremap <leader>gc :GBranches<cr>

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

nnoremap <leader>gs :Gstatus<cr>

let g:fzf_checkout_git_options = '--sort=-committerdate'
let g:fzf_tag_actions = {
      \ 'track': {'keymap': 'ctrl-space'},
      \}
