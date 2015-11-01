" Load plugins
execute pathogen#infect()

" Turn on syntax coloring
syntax on

" Load plugins specific to editing file-type 
filetype plugin on 

" Load file-type specific indentiation specs
filetype indent on

" Indentation parameters
:set expandtab          " Write tabs as spaces 
:set tabstop=4          " Visual columns in a tab
:set shiftwidth=4       " Spaces in an indent
:set autoindent         " Automatically indent

" Status Bar Parameters
:set laststatus=2       " Always show status bar
:set statusline+=%f     " Just show relative path to file in buffer

" Key Bindings 
:set noesckeys          " No ESC-O sequences (so no super slow O line inserts)

" Command Mappings
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Insert-mode: Disable Arrow Keys 
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>

" Visual-mode: Disable arrow keys
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Disable the annoying Ex mode
nnoremap Q <nop>

" Set python3 interpreter for checker
let g:syntastic_python_python_exec = 'python3'
