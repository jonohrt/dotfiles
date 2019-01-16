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

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore .vscode -g ""'
set shell=zsh
set diffopt+=vertical
let g:incsearch#auto_nohlsearch = 1
"Stop quickfix prompt for large messages at the cost of less editing room
set cmdheight=1
" highlight current line
set cursorline
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
au CursorHold * checktime
set scrolloff=2            " Ensure there's always a little space above and below the current line
set splitbelow             " Open horizontal splits below the current pane
set splitright             " Open vertical splits to the right of the current pane
set inccommand=nosplit     " Incrementally show effects of commands
set clipboard=unnamed

" Set the location of the spellfile
" set spellfile=~/.config/nvim/spelling/en.utf-8.add


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

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-r>"
let g:UltiSnipsEditSplit="vertical"
let NERDTreeQuitOnOpen=1


autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

