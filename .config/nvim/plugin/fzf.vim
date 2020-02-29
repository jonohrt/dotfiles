
let g:fzf_quickfix_use_loclist = 1

let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{node_modules,.git/*,build}" -g "!coverage/*"'
