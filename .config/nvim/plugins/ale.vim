let g:ale_sign_warning='⚠'
let g:ale_sign_error='✖'
let g:ale_javascript_enabled_makers = ['eslint']
let g:ale_bash_enabled_makers = ['shellcheck']
let g:ale_ruby_rubocop_executable = './bin/rubocop'
let g:ale_javascript_eslint_executable = 'yarn eslint'
let g:ale_linters = {'javascriptreact': ['eslint'], 'javascript': ['eslint'], 'ruby': ['rubocop'], 'bash':['shellcheck'] }
let g:ale_fixers = {}
let g:ale_fixers.javascript = [ 'eslint']
let g:ale_fixers.ruby = ['rubocop']
let g:ale_fixers.javascriptreact =  ['eslint']
" let g:ale_ruby_rubocop_options = ''
let g:ale_fix_on_save = 1

