let g:elm_setup_keybindings = 1
" Leader mappings
let mapleader = " "

autocmd VimEnter *
\ command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>, '', { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, <bang>0)

nnoremap <leader>w :w<cr>
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" use tab to forward cycle
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" " use tab to backward cycle
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

tnoremap <C-n> <C-\><C-n>

nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap <c-b> ^
nnoremap <c-e> $
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)

nnoremap <leader>o :Files<cr>
nnoremap <leader>p :Buffers<cr>
nnoremap <leader>fa :Ag<space>

"paste from buffer 0
nnoremap <c-p> "0p
nnoremap <c-P> "0P
vnoremap <c-p> "0p
vnoremap <c-P> "0P

" Map ✠ (U+2720) to <S-CR>, so we have <S-CR> mapped to ✠ in iTerm2 and
" ✠ mapped back to <S-CR> in Vim.
nmap ✠ <S-CR>
noremap <S-CR> O<Esc>
nmap <CR> o<Esc>
nnoremap <leader>le <C-^>

nnoremap <leader><leader> :noh<CR>
nnoremap <leader>c gc

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
function! UnmapCommentary()
  unmap gc
  nunmap gcc
  nunmap cgc
  nunmap gcu
endfunction

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

xmap <leader>c  <Plug>Commentary
nmap <leader>c  <Plug>Commentary
omap <leader>c  <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine
nmap <leader>cu <Plug>Commentary<Plug>Commentary


map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

augroup bepo_clash
  autocmd!
  autocmd VimEnter * call UnmapCommentary()
augroup END

let g:EasyMotion_do_mapping = 0 " Disable default mappings
map  <Leader>f1 <Plug>(easymotion-bd-f)
nmap <Leader>f1 <Plug>(easymotion-overwin-f)
nmap <leader>f2 <Plug>(easymotion-overwin-f2)
map  <Leader>fw <Plug>(easymotion-bd-w)
nmap <Leader>fw <Plug>(easymotion-overwin-w)
nmap <Leader>fil <Plug>(easymotion-sl)
nmap <Leader>fiw <Plug>(easymotion-bd-wl)
nnoremap <leader>ve :e ~/.config/nvim/editing.vim<cr>
nnoremap <leader>vk :e ~/.config/nvim/keybindings.vim<cr>
nnoremap <leader>vs :e ~/.config/nvim/syntax.vim<cr>
nnoremap <leader>vi :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>vp :e ~/.config/nvim/plugins.vim<cr>
nnoremap <leader>vt :e ~/.config/nvim/themes.vim<cr>

nnoremap <leader>fs :Snippets<cr>
nnoremap <leader>fc :Commits<cr>
nnoremap <leader>fcc :BCommits<cr>
nnoremap <leader>fg :GFiles?<cr>
nnoremap <leader>fh :History<cr>
nnoremap <leader>f: :History:<cr>
nnoremap <leader>f/ :History/<cr>
nnoremap <leader>fl :BLines<cr>
nnoremap <leader>fb :Lines<cr>

nnoremap <c-n> :NERDTreeToggle<cr>

nnoremap <leader>k :bd<cr>
nnoremap Y y$
" nnoremap <up> :<up>
nnoremap <silent> <Leader>df :call DiffToggle()<CR>

function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
:endfunction


nnoremap <space>im :TsuImport<cr>
