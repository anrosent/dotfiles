"
" Lots of great tips from http://dougblack.io/words/a-good-vimrc.html
"

" Load plugins
execute pathogen#infect()

" Turn on syntax coloring
syntax on

" Load plugins specific to editing file-type 
filetype plugin on 

" Load file-type specific indentiation specs
filetype indent on

" Indentation parameters
set expandtab           " Write tabs as spaces 
set tabstop=4           " Visual columns in a tab
set softtabstop=4       " Something similar to tabstop
set shiftwidth=4        " Spaces in an indent
set autoindent          " Automatically indent

" UI
set number              " Show line numbers
set cursorline          " Underline current line
set lazyredraw          " Redraw only when we need to
set showmatch           " Highlight matching paren/bracket/etc

" Search
set noincsearch         " Don't search as I type
set hlsearch            " Highlight search matches
" Remove highlights on search matches (otherwise they stay until next search)
nnoremap <space> :nohlsearch<CR>

" Status Bar Parameters
set laststatus=2        " Always show status bar
set statusline+=%f      " Just show relative path to file in buffer

" Key Bindings 
set noesckeys           " No ESC-O sequences (so no super slow O line inserts)

" Navigate visually, not line-wise
nnoremap j gj
nnoremap k gk

" Shortcuts for start/end of line
nnoremap B ^
nnoremap ^ <NOP>
nnoremap E $
nnoremap $ <NOP>

" Select last inserted text (cool)
nnoremap gV `[v`]

" Map escape to jk. Hope you don't type it
inoremap jk <ESC>
" Training
inoremap <ESC> <NOP>

" Toggle Gundo
nnoremap <leader>u :GundoToggle<CR>

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

" Backups so .swp files don't go in cwd
set backup      " enable backups
set backupdir=./.vim_backups,~/.vim_backups,.  " list of backup dirs to scan
set directory=./.vim_backups,~/.vim_backups,.  " not sure
set writebackup



" Set python3 interpreter for checker
let g:syntastic_python_python_exec = 'python3'
