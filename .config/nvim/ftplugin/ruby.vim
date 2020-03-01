function! CallRspec()
  let command = "rspec " . expand("%@") . "\n"
  call Send_to_Tmux(command)
endfunction

function! CallRspecLine()
  let command = "rspec " . expand("%@") . ":" . line(".") . "\n"
  :call Send_to_Tmux(command)
endfunction

nmap <leader>sft :call CallRspec()<cr>
nmap <leader>slt :call CallRspecLine()<cr>


augroup tags
    au!
    au BufWritePost *.rb silent !ripper-tags -R --exclude=log
augroup END


