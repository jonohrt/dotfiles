
call plug#begin('~/.vim/bundle')

" GENERAL
"
"
Plug 'romainl/vim-cool'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'sbdchd/neoformat'
Plug 'snoe/nvim-parinfer.js'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'sjl/gundo.vim'
Plug 'tomlion/vim-solidity'
Plug 'mxw/vim-jsx'
Plug 'ElmCast/elm-vim'
Plug 'flowtype/vim-flow'
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'jceb/vim-hier'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
" Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
Plug 'mhartington/nvim-typescript'
Plug 'tpope/vim-eunuch'
Plug 'terryma/vim-smooth-scroll'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sjl/vitality.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'myusuf3/numbers.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'rizzatti/dash.vim'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'vim-scripts/rubycomplete.vim'
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
Plug 'ervandew/supertab'
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
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'othree/html5.vim'
Plug 'tpope/vim-rails'
" Highlight CSS colors
Plug 'ap/vim-css-color'

" Linting
" Plug 'benekastah/neomake'

" Quickly run Unix commands.
Plug 'tpope/vim-eunuch'

" Automatically resize open splits so the current is the biggest
Plug 'roman/golden-ratio'
Plug 'vim-airline/vim-airline'

Plug 'liuchengxu/space-vim-dark'
call plug#end()
