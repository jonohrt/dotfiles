" Configure the language servers
let g:LanguageClient_serverCommands = {
  \ 'javascript': [ './node_modules/.bin/javascript-typescript-stdio' ],
  \ 'ruby': [ 'bundle', 'exec', 'solargraph', 'stdio' ],
  \ }

" Disable the language client's diagnostics
let g:LanguageClient_useVirtualText = "No"
let g:LanguageClient_diagnosticsEnable = 0
