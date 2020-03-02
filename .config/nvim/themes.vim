" Get italics to work... I think
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

if !has("gui_vimr")
  set guifont=SourceCodePro\ Nerd\ Font:h16
endif
set termguicolors


set guicursor=n-v-c:block,i-ci-ve:ver25-blinkoff400-blinkon250,r-cr:hor20,o:hor50

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'override' : {
  \         'color07' : ['#AEDBFE']
  \       }
  \     }
  \   }
  \ }
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" colorscheme codedark
set background=dark
colorscheme PaperColor
" colorscheme gruvbox

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

highlight Sneak guifg=black guibg=#666666 ctermfg=black ctermbg=gray

call airline#parts#define_function('foo', 'SpinnerText')
let g:airline_section_y = airline#section#create_right(['ffenc','foo'])
