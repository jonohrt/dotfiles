call plug#begin('~/.vim/bundle')


Plug 'tpope/vim-abolish'
" Plug 'arthurxavierx/vim-caser'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'haya14busa/incsearch.vim'
Plug 'git@github.com:tpope/vim-projectionist.git'

" Plug 'thinca/vim-textobj-function-javascript'

" Deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Language client
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vimwiki/vimwiki', { 'as': 'vimwiki-dev', 'branch': 'dev' }
Plug 'tbabej/taskwiki'
Plug 'mattn/calendar-vim'
Plug 'farmergreg/vim-lastplace'
Plug 'jpalardy/vim-slime'
Plug 'jgdavey/tslime.vim'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'
Plug 'janko-m/vim-test'
Plug 'git@github.com:Galooshi/vim-import-js.git'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'wellle/tmux-complete.vim'
" Plug 'c-brenn/fuzzy-projectionist.vim'
Plug 'mbbill/undotree'
Plug 'mxw/vim-jsx'
Plug 'christoomey/vim-tmux-navigator'
" Now Vim can save when iTerm 2 loses focus, even if it's inside tmux!
Plug 'sjl/vitality.vim'
Plug 'ericbn/vim-relativize'
Plug 'rizzatti/dash.vim'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'tpope/vim-fugitive'

" Enable Gbrowse
Plug 'tpope/vim-rhubarb'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'neomake/neomake'
Plug 'dense-analysis/ale'
Plug 'Quramy/vim-js-pretty-template'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
" Plug 'alvan/vim-closetag'
Plug 'tpope/vim-fugitive'
Plug 'itspriddle/vim-shellcheck'
" Sets the project root to the current Git repository by default
Plug 'airblade/vim-rooter'
Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-endwise'

" Shows the current git diff in the gutter.
Plug 'tpope/vim-sleuth'
Plug 'mhinz/vim-signify'

" Language syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'jelera/vim-javascript-syntax'
" Plug  'isRuslan/vim-es6'
" Plug 'sheerun/vim-polyglot'
" Plug 'isruslan/vim-es6'
Plug 'slim-template/vim-slim'
Plug 'othree/html5.vim'

" Snippits
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" FZF
" Plug 'fszymanski/fzf-quickfix'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'psliwka/vim-smoothie'
Plug 'mhinz/vim-startify'
" Linting

" Quickly run Unix commands.
Plug 'tpope/vim-eunuch'

" " Automatically resize open splits so the current is the biggest
Plug 'vim-airline/vim-airline'

" Themes
"
" Highlight CSS colors
Plug 'romainl/Apprentice'
Plug 'ap/vim-css-color'
Plug 'tomasiser/vim-code-dark'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf'
Plug 'nanotech/jellybeans.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'liuchengxu/space-vim-dark'
Plug 'crusoexia/vim-monokai'
call plug#end()
