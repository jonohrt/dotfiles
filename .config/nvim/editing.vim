autocmd!
runtime! plugin/sensible.vim
syntax on
set nocompatible
set hidden
set secure
set smartindent
set shell=zsh
set diffopt+=vertical
let g:incsearch#auto_nohlsearch = 1

"Stop quickfix prompt for large messages at the cost of less editing room
set cmdheight=1

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

" Spelling
set spell spelllang=en_us
" Set the location of the spellfile
set spellfile=~/.config/nvim/spelling/en.utf-8.add
" Set the location of the dictionary
set dictionary+=/usr/share/dict/words

"Use global by default
set gdefault

set timeoutlen=1000 ttimeoutlen=0

" Leader mapping
let mapleader = " "

" When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting
" purposes.
let g:is_posix = 1

let ruby_spellcheck_strings = 1

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Cursor always centered
set scrolloff=999

" automatically reload file
set autoread


" Ignore spell checking for camelcased items
" Borrowed from: https://github.com/teranex/dotvim/blob/master/vimrc#L486
autocmd Syntax * syn match CamelCase
  \ "\(\<\|_\)\%(\u\l*\)\{2,}\(\>\|_\)\|\<\%(\l\l*\)\%(\u\l*\)\{1,}\>" transparent
  \ containedin=.*Comment.*,.*String.*,VimwikiLink contains=@NoSpell contained

au TermOpen * setlocal nospell
