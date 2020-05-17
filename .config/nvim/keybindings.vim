" Use visual line for j and k
nnoremap <leader>fa :Rg<space>
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

nnoremap <leader><leader> :nohl<CR>
nnoremap <leader>c gc

xmap <leader>c  <Plug>Commentary
nmap <leader>c  <Plug>Commentary
omap <leader>c  <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine
nmap <leader>cu <Plug>Commentary<Plug>Commentary

nnoremap <leader>vi :e ~/.config/nvim/init.vim<cr>

nnoremap <leader>fn :!echo -n % \| pbcopy<cr>

" FZF

nnoremap <leader>[ :GFiles<cr>
nnoremap <leader>o :call fzf#vim#files('', fzf#vim#with_preview('right'))<cr>
nnoremap <leader>p :Buffers<cr>
nnoremap <leader>] :call fzf#vim#gfile?('', fzf#vim#with_preview('right'))<cr>
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

nnoremap <leader>k :bd<cr>
nnoremap <leader>K :bd!<cr>
nnoremap Y y$

vmap <Leader>s :call SortLines()<cr>

"Sneak

" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map <leader>s <Plug>Sneak_s
" map <leader>S <Plug>Sneak_S

" tslime
vmap <Leader>st <Plug>SendSelectionToTmux
nmap <Leader>st <Plug>NormalModeSendToTmux
nmap <leader>sr <Plug>SetTmuxVars

nmap <silent> <leader>d <Plug>DashSearch


nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap <leader>lk :bd<cr>

" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" Configure the language client commands
nnoremap <silent> <leader>lc :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>ll :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>lg :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>


" Map Q to quit
ca Q q

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

nnoremap <leader>b :b <C-d>
nnoremap <leader>n :Buffers<cr> <ctrl-j>

nnoremap Q @@
noremap <leader>g :ls<cr>:b<space>
