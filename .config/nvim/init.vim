" #################### PLUGINS #############
call plug#begin('~/.vim/bundle')

" GENERAL

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'tpope/vim-abolish'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'jonohrt/vim-NotableFt'
Plug 'NLKNguyen/papercolor-theme'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rbenv'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'
Plug 'romainl/vim-cool'
Plug 'Chun-Yang/vim-textobj-chunk'
Plug 'kana/vim-textobj-user'
Plug 'janko-m/vim-test'
Plug 'git@github.com:Galooshi/vim-import-js.git'
Plug 'majutsushi/tagbar'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'git@github.com:tpope/vim-projectionist.git'
" Plug 'sbdchd/neoformat'
" Plug 'snoe/nvim-parinfer.js'
Plug 'git@github.com:sjl/gundo.vim.git'
Plug 'mxw/vim-jsx'
" Plug 'ElmCast/elm-vim'
Plug 'flowtype/vim-flow'
" Plug 'wokalski/autocomplete-flow'
" Plug 'vim-scripts/AnsiEsc.vim'
" Plug 'jceb/vim-hier'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'Shougo/vimproc.vim', {'do': 'make'}
" Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
Plug 'mhartington/nvim-typescript'
" Plug 'terryma/vim-smooth-scroll'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sjl/vitality.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'myusuf3/numbers.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'rizzatti/dash.vim'
Plug 'MarcWeber/vim-addon-local-vimrc'
" Plug 'vim-scripts/rubycomplete.vim'
Plug 'scrooloose/nerdtree'
Plug 'tommcdo/vim-fugitive'
Plug 'tpope/vim-unimpaired'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-rhubarb'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'benekastah/neomake'
Plug 'w0rp/ale'
Plug 'Quramy/vim-js-pretty-template'
" Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'haya14busa/incsearch.vim'
" Plug 'ervandew/supertab'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Sets the project root to the current Git repository by default
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-endwise'
" Shows the current git diff in the gutter.
Plug 'tpope/vim-sleuth'
Plug 'airblade/vim-gitgutter'
"
" Language syntax highlighting
" Plug 'digitaltoad/vim-pug'
" Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'

Plug 'jaxbot/semantic-highlight.vim'
Plug 'isruslan/vim-es6'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'othree/html5.vim'
Plug 'tpope/vim-rails'
" Highlight CSS colors
Plug 'ap/vim-css-color'
Plug 'tomasiser/vim-code-dark'

" Linting
" Plug 'benekastah/neomake'

" Quickly run Unix commands.
Plug 'tpope/vim-eunuch'

" Automatically resize open splits so the current is the biggest
Plug 'roman/golden-ratio'
Plug 'vim-airline/vim-airline'

Plug 'liuchengxu/space-vim-dark'
call plug#end()

" ###################### EDITING #################
autocmd!
runtime! plugin/sensible.vim
runtime! plugin/supertab.vim
syntax on
set nocompatible
set hidden
set exrc
set secure
filetype plugin indent on
set smartindent

" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore .vscode -g ""'
" let FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
set shell=zsh
set diffopt+=vertical
let g:incsearch#auto_nohlsearch = 1
"Stop quickfix prompt for large messages at the cost of less editing room
set cmdheight=1
" highlight current line
set cursorline
set cursorcolumn
set ignorecase smartcase
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=longest,list

" Columns
set textwidth=100          " The maximum width of the text being inserted
set linebreak              " Wrap characters at the breakat point rather than the edge of the screen
set breakindent            " When text wraps, it should continue to be indented
set colorcolumn=+1         " Highlight the line after the textwidth

" Search
set ignorecase smartcase

" Tabs
set tabstop=2              " The number of spaces a tab counts for
set shiftwidth=2           " The number of spaces to use for indentation step
set shiftround             " Round to multiples of the shift width
set expandtab              " Use the correct number of spaces to insert a tab in insert mode
set breakindentopt=shift:2 " Indent by two spaces when wrapping

" Line numbers
set number                 " Use line numbers (who wouldn't want this?)
set numberwidth=5          " Make room for line numbers up to 9999
set relativenumber         " Use relative line numbers

" Other standard editor configuration
set noswapfile             " Don't create swapfiles.
set nowritebackup          " Don't create backups before overwriting files.
set undofile               " Use an undo file for persistent undos
set autowrite              " Automatically :write before running commands
set nojoinspaces           " Only join with one space after punctuation
set nomodeline             " Turn off modelines
set autoread               " Automatically read changes to files edited outside of Vim
" au CursorHold * checktime
set scrolloff=2            " Ensure there's always a little space above and below the current line
set splitbelow             " Open horizontal splits below the current pane
set splitright             " Open vertical splits to the right of the current pane
set inccommand=nosplit     " Incrementally show effects of commands
set clipboard=unnamed

set spell spelllang=en_us
" Set the location of the spellfile
set spellfile=~/.config/nvim/spelling/en.utf-8.add


set timeoutlen=1000 ttimeoutlen=0

" Set the location of the dictionary
set dictionary+=/usr/share/dict/words
let g:tcommentMapLeaderOp1 ="/<space>"
let g:deoplete#enable_at_startup = 1

"removing spaces on save
autocmd BufWritePre * %s/\s\+$//e

augroup myvimrc
    au!
    au BufWritePost *.vim,.vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

let g:UltiSnipsSnippetDirectories = ['/Users/johrt/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"
let g:UltiSnipsEditSplit="vertical"
let NERDTreeQuitOnOpen=1


" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" ########################### KEYBINDINGS ##############3
" same bindings for merging diffs as in normal mode
xnoremap <leader>dp :diffput<cr>
xnoremap <leader>do :diffget<cr>
" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
let g:elm_setup_keybindings = 1
" Leader mappings
let mapleader = " "

nmap yof :let b:ale_fix_on_save=0<CR>
" nnoremap gm m
" nnoremap m d
" xnoremap m d

" nnoremap mm dd
" nnoremap M D
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_Tnmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-a> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
" augroup qs_colors
"   autocmd!
"   autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
"   autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
"   " autocmd ColorScheme * highlight QuickScopePrimary guifg=LightYellow gui=underline ctermfg=155 cterm=underline
"   " autocmd ColorScheme * highlight QuickScopeSecondary guifg=DarkYellow gui=underline ctermfg=81 cterm=underline
" augroup END

" autocmd VimEnter *
" \ command! -bang -nargs=* Ag
" \ call fzf#vim#ag(<q-args>, '', { 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, <bang>0)
nnoremap <leader>w :w<cr>
" inoremap <silent><expr> <TAB>
"     \ pumvisible() ? "\<C-n>" :
"     \ <SID>check_back_space() ? "\<TAB>" :
"     \ deoplete#mappings#manual_complete()
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
nnoremap 0 ^
nnoremap ^ 0
nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
nmap <silent> <leader>aj <Plug>(ale_next_wrap)



" Map ✠ (U+2720) to <S-CR>, so we have <S-CR> mapped to ✠ in iTerm2 and
" ✠ mapped back to <S-CR> in Vim.
nmap ✠ <S-CR>
noremap <S-CR> O<Esc>
nmap <CR> o<Esc>
nnoremap <leader>le <C-^>

nnoremap <leader><leader> :noh<CR>
nnoremap <leader>c gc


" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<C-l>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

let g:EasyMotion_smartcase = 1

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
" use tab to forward cycle
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" " use tab to backward cycle
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

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


let g:EasyMotion_do_mapping = 0 " Disable default mappings
map <Leader>s <Plug>(easymotion-bd-f)
map  <Leader>d <Plug>(easymotion-bd-f2)
nmap <Leader>d <Plug>(easymotion-overwin-f2)
map  <Leader>fw <Plug>(easymotion-bd-w)
nmap <Leader>fw <Plug>(easymotion-overwin-w)
nmap <Leader>fil <Plug>(easymotion-sl)
nmap <Leader>fiw <Plug>(easymotion-bd-wl)
nnoremap <leader>vi :e ~/.config/nvim/init.vim<cr>

nnoremap <leader>o :Files<cr>
nnoremap <leader>[ :GFiles<cr>
nnoremap <leader>p :Buffers<cr>
nnoremap <leader>fa :Rg<space>
nnoremap <leader>fs :Snippets<cr>
nnoremap <leader>fc :Commits<cr>
nnoremap <leader>fcc :BCommits<cr>
nnoremap <leader>] :GFiles?<cr>
nnoremap <leader>fh :History<cr>
nnoremap <leader>f: :History:<cr>
nnoremap <leader>f/ :History/<cr>
nnoremap <leader>fl :BLines<cr>
nnoremap <leader>fb :Lines<cr>

nnoremap <Leader>n :NERDTreeToggle<cr>

nnoremap <leader>k :bd<cr>
nnoremap Y y$
" nnoremap <up> :<up>
" nnoremap <silent> <Leader>df :call DiffToggle()<CR>

" function! DiffToggle()
"     if &diff
"         diffoff
"     else
"         diffthis
"     endif
" :endfunction


nnoremap <space>im :TsuImport<cr>

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" ########################## SYNTAX #####################
let g:LanguageClient_serverCommands = {
      \ 'ruby': ['solargraph', 'stdio'],
      \ }
let g:LanguageClient_autoStart=1
let g:LanguageClient_autoStop=1

" Rename - rn => rename
noremap <leader>rn :call LanguageClient#textDocument_rename()<CR>

" Rename - rc => rename camelCase
noremap <leader>rc :call LanguageClient#textDocument_rename(
            \ {'newName': Abolish.camelcase(expand('<cword>'))})<CR>

" Rename - rs => rename snake_case
noremap <leader>rs :call LanguageClient#textDocument_rename(
            \ {'newName': Abolish.snakecase(expand('<cword>'))})<CR>

" Rename - ru => rename UPPERCASE
noremap <leader>ru :call LanguageClient#textDocument_rename(
            \ {'newName': Abolish.uppercase(expand('<cword>'))})<CR>
nnoremap <Leader>lm :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <Leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <Leader>lr :call LanguageClient#textDocument_references()<CR>

" Configure Neomake
" autocmd! BufWritePost,BufReadPost * Neomake
" autocmd BufWritePre *.js Neoformat
" let g:EasyClipUseSubstituteDefaults = 1
" let g:EasyClipUsePasteDefaults = 0
let test#strategy = "neovim"
let test#neovim#term_position = "vert"
let g:yoinkIncludeDeleteOperations = 1
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
" s for substitute
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

let g:hardtime_default_on = 1
let g:test#preserve_screen = 1
set completeopt=longest,menuone,preview
" let g:neomake_javascript_enabled_makers = ['eslint']
let g:ale_sign_warning='⚠'
let g:ale_sign_error='✖'
" let g:ale_sign_error='x'
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

let g:flow#enable=0
let g:tsuquyomi_disable_quickfix = 1
let g:neomake_jsx_enabled_makers = ['eslint']
let g:ale_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_checkers = ['tsuquyomi', 'tslint'] " You shouldn't use 'tsc' checker.
let g:ale_ruby_rubocop_executable = './bin/rubocop'
let g:ale_javascript_eslint_executable = 'yarn eslint'
let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop'] }
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fixers.ruby = ['rubocop']
let g:ale_ruby_rubocop_options = ''
let g:ale_fix_on_save = 1
" let g:ale_history_log_output=1
" autocmd BufWrite *.rb ALEFix
" Prevent vim-json from concealing quotes
" let g:vim_json_syntax_conceal = 0

" Configure Vim Pencil
" let g:pencil#wrapModeDefault = 'soft'

" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
"   autocmd FileType text call pencil#init()
" augroup END

" Ignore spell checking for camelcased items
" Borrowed from: https://github.com/teranex/dotvim/blob/master/vimrc#L486
autocmd Syntax * syn match CamelCase
  \ "\(\<\|_\)\%(\u\l*\)\{2,}\(\>\|_\)\|\<\%(\l\l*\)\%(\u\l*\)\{1,}\>" transparent
  \ containedin=.*Comment.*,.*String.*,VimwikiLink contains=@NoSpell contained

" Set the filetypes for extensions Vim doesn't recognize by default
autocmd BufRead,BufNewFile *.njs set filetype=jinja

" Always use two spaces for tabs
set tabstop=2 shiftwidth=2 expandtab

" When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting
" purposes.
let g:is_posix = 1



" deoplete
"
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips']
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
 call deoplete#custom#option({
    \ 'max_list': 20
    \ })
let g:deoplete#enable_at_startup = 1

" neosnippet

let g:neosnippet#enable_completed_snippet = 1

let ruby_spellcheck_strings = 1
" ################## THEMES #################

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
if !has("gui_vimr")
  set guifont=SourceCodePro\ Nerd\ Font:h11
endif
set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" colorscheme codedark
set background=dark
colorscheme PaperColor
let g:airline_theme='codedark'
set encoding=utf8
let g:airline_powerline_fonts = 1
let g:onedark_terminal_italics = 1
hi CursorLineNr guifg=#6291E8
hi Comment cterm=italic
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
hi Search guibg=#b92c60 guifg=wheat
highlight Comment gui=italic
