filetype plugin indent on
" #################### PLUGINS #############
call plug#begin('~/.vim/bundle')
" " GENERAL
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}

Plug 'tpope/vim-abolish'
Plug 'thinca/vim-textobj-function-javascript'
" Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'vimwiki/vimwiki', { 'as': 'vimwiki-dev', 'branch': 'dev' }
Plug 'tbabej/taskwiki'
Plug 'mattn/calendar-vim'
Plug 'michal-h21/vim-zettel'
Plug 'jonohrt/vim-NotableFt'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rbenv'
Plug 'farmergreg/vim-lastplace'
Plug 'jpalardy/vim-slime'
Plug 'jgdavey/tslime.vim'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'
Plug 'janko-m/vim-test'
Plug 'git@github.com:Galooshi/vim-import-js.git'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'git@github.com:tpope/vim-projectionist.git'

Plug 'c-brenn/fuzzy-projectionist.vim'
Plug 'mbbill/undotree'
Plug 'romainl/Apprentice'
Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sjl/vitality.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ericbn/vim-relativize'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'rizzatti/dash.vim'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'scrooloose/nerdtree'
Plug 'tommcdo/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-rhubarb'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'neomake/neomake'
Plug 'w0rp/ale'
Plug 'Quramy/vim-js-pretty-template'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-fugitive'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Sets the project root to the current Git repository by default
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-endwise'
" Shows the current git diff in the gutter.
Plug 'tpope/vim-sleuth'
Plug 'mhinz/vim-signify'
"
" Language syntax highlighting
" Plug 'digitaltoad/vim-pug'
" Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'elzr/vim-json'
" Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'jelera/vim-javascript-syntax'
Plug  'isRuslan/vim-es6'
Plug 'sheerun/vim-polyglot'
Plug 'isruslan/vim-es6'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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
Plug 'fszymanski/fzf-quickfix'
call plug#end()

" ###################### EDITING #################
let g:taskwiki_markup_syntax = 'markdown'
let g:taskwiki_disable_concealcursor='yes'
let g:calendar_options = 'nornu'

let g:vimwiki_map_prefix = '<Leader>vw'

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/work',  'syntax': 'markdown', 'ext': '.md'},
                      \ {'path': '~/Dropbox/vimwiki/home', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1},
                      \ {'path': '~/Dropbox/vimwiki/workout', 'syntax': 'markdown', 'ext': '.md', 'auto_tags': 1}
                      \ ]


let g:fzf_quickfix_use_loclist = 1

function! Vimwiki_search(word)
  execute ':VWS '. a:word
  execute 'call fzf_quickfix#run()'
endfunction

command! -nargs=* FZFVWS :call Vimwiki_search(<q-args>)


autocmd!
runtime! plugin/sensible.vim
syntax on
set nocompatible
set hidden
set exrc
set secure
set smartindent

" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore .vscode -g ""'
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" -g "!coverage/*"'
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" -g "!coverage/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
set shell=zsh
set diffopt+=vertical
let g:incsearch#auto_nohlsearch = 1
"Stop quickfix prompt for large messages at the cost of less editing room
set cmdheight=1
" highlight current line
" set cursorline
" set cursorcolumn
set ignorecase smartcase
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=longest,list

set mouse=nv
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
set scrolloff=2            " Ensure there's always a little space above and below the current line
set splitbelow             " Open horizontal splits below the current pane
set splitright             " Open vertical splits to the right of the current pane
set inccommand=nosplit     " Incrementally show effects of commands
set clipboard=unnamed

set spell spelllang=en_us
" Set the location of the spellfile
set spellfile=~/.config/nvim/spelling/en.utf-8.add

"Use global by default
set gdefault

set timeoutlen=1000 ttimeoutlen=0

" Set the location of the dictionary
set dictionary+=/usr/share/dict/words
let g:tcommentMapLeaderOp1 ="/<space>"

" let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB'
let g:targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'

"removing spaces on save
autocmd BufWritePre * %s/\s\+$//e

autocmd BufWritePost *.md silent :!task sync
autocmd BufReadPre *.md silent :!task sync

augroup myvimrc
    au!
    au BufWritePost *.vim,.vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"
let g:UltiSnipsEditSplit="vertical"
let NERDTreeQuitOnOpen=1

" ########################### KEYBINDINGS ##############3

function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction


nmap <Leader>jf :%!python -m json.tool<cr>
imap <C-D> <C-O>x

map <Leader>/  <Plug>(incsearch-fuzzy-/)
map <Leader>?  <Plug>(incsearch-fuzzy-?)
map <Leader>g/ <Plug>(incsearch-fuzzy-stay)

map z/ <Plug>(incsearch-fuzzyword-/)
map z? <Plug>(incsearch-fuzzyword-?)
map zg/ <Plug>(incsearch-fuzzyword-stay)

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>`

imap <C-v> <Plug>delimitMateS-Tab

nnoremap <expr> g<c-v> '`[' . strpart(getregtype(), 0, 1) . '`]'

autocmd VimEnter * nnoremap yon :RelativizeToggle<cr>
nnoremap <space>u :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1
let g:elm_setup_keybindings = 1
" Leader mappings
let mapleader = " "

" Jump to the first non-empty line of a paragraph
nnoremap { {{)
nnoremap } })

nnoremap <space>nd :NeomakeDisable<cr>
nnoremap <space>ne :NeomakeEnable<cr>
nmap yof :let b:ale_fix_on_save=0<CR>

nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-a> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

nnoremap <leader>w :w<cr>

function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

tnoremap <C-n> <C-\><C-n>

nnoremap 0 ^
nnoremap ^ 0
nmap <silent> [i <Plug>(ale_previous_wrap)
nmap <silent> ]i <Plug>(ale_next_wrap)



" Map ✠ (U+2720) to <S-CR>, so we have <S-CR> mapped to ✠ in iTerm2 and
" ✠ mapped back to <S-CR> in Vim.
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


map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


" Vimwiki search
nmap <Leader>wf :FZFVWS<space>

nnoremap <leader>vi :e ~/.config/nvim/init.vim<cr>

nnoremap <leader>o :GFiles<cr>
nnoremap <leader>[ :Files<cr>
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
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

nnoremap <Leader>n :NERDTreeToggle<cr>

nnoremap <leader>k :bd<cr>
nnoremap Y y$


vmap <Leader>s :call SortLines()<cr>

vmap <Leader>st <Plug>SendSelectionToTmux
nmap <Leader>st <Plug>NormalModeSendToTmux
nmap <leader>sr <Plug>SetTmuxVars
" ########################## SYNTAX #####################

" Configure Neomake
let g:test#strategy = 'neomake'
let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
let g:async_make_green_success_prefix = ' ✓ '
let g:async_make_green_failure_prefix = ' ✖ '
let g:async_make_green_default_success_text = 'All tests passed'
let g:async_make_green_use_make_output_on_success = 0
let g:neomake_open_list = 2
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

let g:test#preserve_screen = 1
set completeopt=longest,menuone,preview
" let g:neomake_javascript_enabled_makers = ['eslint']
let g:ale_sign_warning='⚠'
let g:ale_sign_error='✖'
let g:neomake_jsx_enabled_makers = ['eslint']
let g:ale_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_checkers = ['tsuquyomi', 'tslint'] " You shouldn't use 'tsc' checker.
let g:ale_ruby_rubocop_executable = './bin/rubocop'
let g:ale_javascript_eslint_executable = 'yarn eslint'
let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop'] }
let g:ale_fixers = {}
let g:ale_fixers.javascript = [ 'eslint']
let g:ale_fixers.ruby = ['rubocop']
let g:ale_ruby_rubocop_options = ''
let g:ale_fix_on_save = 1


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

let ruby_spellcheck_strings = 1


""""""""""""""""""'" COC Config

" " Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" " Remap keys for gotos
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gy <Plug>(coc-type-definition)
nmap <Leader>gi <Plug>(coc-implementation)
nmap <Leader>gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" " Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" " Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
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
" colorscheme Apprentice
" colorscheme hybrid_material
" colorscheme hybrid_reverse
let g:airline_theme='codedark'
" let g:airline_theme='one'
set encoding=utf8
let g:airline_powerline_fonts = 1
let g:onedark_terminal_italics = 1
hi CursorLineNr guifg=#6291E8
hi Comment cterm=italic
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
hi Search guibg=#444444 guifg=wheat
highlight Comment gui=italic

call airline#parts#define_function('foo', 'SpinnerText')
let g:airline_section_y = airline#section#create_right(['ffenc','foo'])


let s:spinner_index = 0
let s:active_spinners = 0
" let s:spinner_states = ['┤', '┘', '┴', '└', '├', '┌', '┬', '┐']
" let s:spinner_states = ['┤', '┘', '┴', '└', '├', '┌', '┬', '┐']
" let s:spinner_states = ['←', '↑', '→', '↓']
" let s:spinner_states = ['d', 'q', 'p', 'b']
" let s:spinner_states = ['.', 'o', 'O', '°', 'O', 'o', '.']
" let s:spinner_states = ['■', '□', '▪', '▫', '▪', '□', '■']
" let s:spinner_states = ['|', '/', '--', '\', '|', '/', '--', '\']
let s:spinner_states = ['←', '↖', '↑', '↗', '→', '↘', '↓', '↙']

function! StartSpinner()
    let b:show_spinner = 1
    let s:active_spinners += 1
    if s:active_spinners == 1
        let s:spinner_timer = timer_start(1000 / len(s:spinner_states), 'SpinSpinner', {'repeat': -1})
    endif
endfunction

function! StopSpinner()
    let b:show_spinner = 0
    let s:active_spinners -= 1
    if s:active_spinners == 0
        :call timer_stop(s:spinner_timer)
    endif
endfunction

function! SpinSpinner(timer)
    let s:spinner_index = float2nr(fmod(s:spinner_index + 1, len(s:spinner_states)))
    redraw
endfunction

function! SpinnerText()
    if get(b:, 'show_spinner', 0) == 0
        return " "
    endif

    return s:spinner_states[s:spinner_index]
endfunction

augroup neomake_hooks
    au!
    autocmd User NeomakeJobInit :call StartSpinner()
    autocmd User NeomakeJobInit :echom "Build started"
    autocmd User NeomakeFinished :call StopSpinner()
    autocmd User NeomakeFinished :echom "Build complete"
augroup END

