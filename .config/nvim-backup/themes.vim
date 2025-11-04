" Get italics to work... I think
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

if !has("gui_vimr")
  set guifont=SourceCodePro\ Nerd\ Font:h16
endif
set termguicolors


set guicursor=n-v-c:block,i-ci-ve:ver25-blinkoff400-blinkon250,r-cr:hor20,o:hor50

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set background=dark

colorscheme afterglow
set encoding=utf8
let g:airline_powerline_fonts = 1
highlight Comment gui=italic

" Fix background colors for floating window in conjure.
highlight NormalFloat ctermbg=black guibg=black

call airline#parts#define_function('foo', 'SpinnerText')
let g:airline_section_y = airline#section#create_right(['ffenc','foo'])

