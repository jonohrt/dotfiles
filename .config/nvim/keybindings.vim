" Use visual line for j and k
nmap j gj
nmap k gk

" Format json file
nmap <Leader>jf :%!python -m json.tool<cr>

cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>`

nnoremap <expr> g<c-v> '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap yon :RelativizeToggle<cr>
nnoremap <space>u :UndotreeToggle<cr>

" Jump to the first non-empty line of a paragraph
nnoremap { {{)
nnoremap } })

nmap yof :let b:ale_fix_on_save=0<CR>

nmap <silent> t<C-d> :TestFile<CR>

nmap <silent> t<C-a> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

nnoremap <leader>w :w<cr>

function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" tnoremap <C-n> <C-\><C-n>

nnoremap 0 ^
nnoremap ^ 0
nmap <silent> [i <Plug>(ale_previous_wrap)
nmap <silent> ]i <Plug>(ale_next_wrap)

" Vimwiki search
nmap <Leader>wf :FZFVWS<space>

nmap ✠ <S-CR>
noremap <S-CR> O<Esc>
nmap <CR> o<Esc>
nnoremap <leader>le <C-^>

nnoremap <leader><leader> :noh<CR>
nnoremap <leader>c gc

xmap <leader>c  <Plug>Commentary
nmap <leader>c  <Plug>Commentary
omap <leader>c  <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine
nmap <leader>cu <Plug>Commentary<Plug>Commentary

nnoremap <leader>vi :e ~/.config/nvim/init.vim<cr>

nnoremap <leader>fn :!echo -n % \| pbcopy<cr>

nnoremap <leader>[ :GFiles<cr>
nnoremap <leader>o :call fzf#vim#files('', fzf#vim#with_preview('right'))<cr>
nnoremap <leader>p :call fzf#vim#buffers('', fzf#vim#with_preview('right'))<cr>
nnoremap <leader>fa :Rg<space>
nnoremap <leader>fs :Snippets<cr>
nnoremap <leader>fc :Commits<cr>
nnoremap <leader>fcc :BCommits<cr>
nnoremap <leader>] :GFiles?<cr>
nnoremap <leader>fh :History<cr>
nnoremap <leader>f: :History:<cr>
nnoremap <leader>f/ :History/<cr>
nnoremap <leader>fl :BLines<cr>
nnoremap <leader>fL :Lines<cr>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

nnoremap <leader>k :bd<cr>
nnoremap Y y$


vmap <Leader>s :call SortLines()<cr>

" tslime
vmap <Leader>st <Plug>SendSelectionToTmux
nmap <Leader>st <Plug>NormalModeSendToTmux
nmap <leader>sr <Plug>SetTmuxVars

nmap <silent> <leader>d <Plug>DashSearch


" nmap <c-n> <plug>(YoinkPostPasteSwapBack)
" nmap <c-p> <plug>(YoinkPostPasteSwapForward)

" nmap p <plug>(YoinkPaste_p)
" nmap P <plug>(YoinkPaste_P)

" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" Configure the language client commands
nnoremap <silent> <leader>lc :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>ll :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>lg :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>
