execute pathogen#infect()

syntax on
filetype plugin indent on
:set tabstop=4 shiftwidth=4 expandtab autoindent
:set cindent
:set laststatus=2 statusline+=%f

:command WQ wq
:command Wq wq
:command W w
:command Q q

let g:syntastic_python_python_exec = 'python3'
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
