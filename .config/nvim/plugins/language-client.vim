" Configure the language servers
let g:LanguageClient_serverCommands = {
  \ 'javascript': [ './node_modules/.bin/javascript-typescript-stdio' ],
  \ 'ruby': [ 'bundle', 'exec', 'solargraph', 'stdio' ],
  \ }

" Disable the language client's diagnostics
let g:LanguageClient_useVirtualText = "No"
let g:LanguageClient_diagnosticsEnable = 0

" Configure the language client commands
nnoremap <silent> <leader>lc :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>lf :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <leader>ll :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>lg :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>
