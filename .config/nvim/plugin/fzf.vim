let g:fzf_quickfix_use_loclist = 1

let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{node_modules,.git/*,build}" -g "!coverage/*"'

let $FZF_DEFAULT_OPTS='--bind ctrl-n:down --layout=reverse'

" Border style (rounded / sharp / horizontal)
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.6, 'highlight': 'Todo', 'border': 'rounded' } }
