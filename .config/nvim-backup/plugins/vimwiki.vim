let g:taskwiki_markup_syntax = 'markdown'
let g:taskwiki_disable_concealcursor='yes'
let g:calendar_options = 'nornu'

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/main',  'syntax': 'markdown', 'ext': '.md'},
                      \ {'path': '~/Dropbox/vimwiki/work', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1}]
                      " \ {'path': '~/Dropbox/vimwiki/tech', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1}
                      " \ ]
                      "

" Vimwiki search
nmap <Leader>wf :FZFVWS<space>

function! Vimwiki_search(word)
  execute ':VWS '. a:word
  execute 'call fzf_quickfix#run()'
endfunction

command! -nargs=* FZFVWS :call Vimwiki_search(<q-args>)

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

