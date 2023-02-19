call plug#begin('~/.config/nvim/bundle')

Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'haya14busa/incsearch.vim'

Plug 'jreybert/vimagit'
Plug 'git@github.com:tpope/vim-projectionist.git'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'preservim/nerdtree'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'farmergreg/vim-lastplace'
"Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'
"Plug 'janko-m/vim-test'
Plug 'git@github.com:galooshi/vim-import-js.git'
Plug 'AndrewRadev/splitjoin.vim'
"Plug 'melonmanchan/vim-tmux-resizer'
"Plug 'wellle/tmux-complete.vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'vimwiki/vimwiki'
"Plug 'tools-life/taskwiki'
"Plug 'blindFS/vim-taskwarrior'
"Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
"" Plug 'mxw/vim-jsx'
" Plug 'christoomey/vim-tmux-navigator'
"Plug 'junegunn/vim-emoji'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"" Language servers
"Plug 'autozimu/LanguageClient-neovim', {
"  \ 'branch': 'next',
"  \ 'do': 'bash install.sh',
"  \ }
"" Now Vim can save when iTerm 2 loses focus, even if it's inside tmux!
Plug 'sjl/vitality.vim'
Plug 'ericbn/vim-relativize'

Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'tpope/vim-fugitive'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'TimUntersberger/neogit'

"" Enable Gbrowse
Plug 'tpope/vim-rhubarb'
Plug 'neovim/nvim-lspconfig'
" Plug 'lukas-reineke/lsp-format.nvim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/playground'


Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
"Plug 'neomake/neomake'
" Plug 'dense-analysis/ale'
" Plug 'nathunsmitty/nvim-ale-diagnostic', {'branch': 'main'}
"Plug 'Quramy/vim-js-pretty-template'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
""
"Plug 'itspriddle/vim-shellcheck'
"" Sets the project root to the current Git repository by default
Plug 'airblade/vim-rooter'
"Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-endwise'

"" Shows the current git diff in the gutter.
Plug 'tpope/vim-sleuth'
" Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'


"" Language syntax highlighting
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'gavocanov/vim-js-indent'
"Plug 'elzr/vim-json'
"Plug 'othree/yajs.vim'
"Plug 'othree/es.next.syntax.vim'
"Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'slim-template/vim-slim'
"Plug 'othree/html5.vim'

"" Clojure
"Plug 'guns/vim-sexp'
"Plug 'tpope/vim-sexp-mappings-for-regular-people'
"Plug 'Olical/conjure', { 'branch': 'develop' }

"" Snippits
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

"" FZF
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"" Linting

"Plug 'kchmck/vim-coffee-script'
"" Quickly run Unix commands.
Plug 'tpope/vim-eunuch'

"" " Automatically resize open splits so the current is the biggest
Plug 'vim-airline/vim-airline'

"" Themes
""
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'danilo-augusto/vim-afterglow'

"" Scratchpad
"Plug 'Konfekt/vim-scratchpad'
call plug#end()
