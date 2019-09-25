"
" Lots of great tips from http://dougblack.io/words/a-good-vimrc.html
"
" Load plugins
execute pathogen#infect()

" make . backspace, hopefully this helps my wrist
noremap . hx

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
nnoremap q <ESC>

" Training
inoremap <ESC> <NOP>

" Toggle Gundo
nnoremap <leader>u :GundoToggle<CR>

" Indent file
"map ,f gg=G''k<CR>
noremap ,f :Autoformat<CR>

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

nmap <C-I> <C-W>

" Go to last file
nmap <C-l> :e#<CR>

" Go to first file
nnoremap <C-K> :e#1<CR>

" Go to file
nmap F gf<CR> 

" Disable the annoying Ex mode
nnoremap Q <nop>

" Toggle numbers
nmap ,nn :set nonumber<CR>
nmap ,mm :set number<CR>

" Toggle paste
nmap ,ss :set paste
nmap ,ns :set nopaste

" Quick saving
nmap fx :wq<CR>
nmap fw :w<CR>
nmap fq :q<CR>

" Backups so .swp files don't go in cwd
set backup      " enable backups
set backupdir=./.vim_backups,~/.vim_backups,.  " list of backup dirs to scan
set directory=./.vim_backups,~/.vim_backups,.  " not sure
set writebackup

" Fuzzy file opening
let g:ctrlp_map = '<c-g>'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Set python3 interpreter for checker
" let g:syntastic_python_python_exec = 'python3'

" Make format key run AutoPep8 for python files
"autocmd Filetype python nmap ,f :Autopep8<CR>

" Disable annoying autopep8 popup diff window
let g:autopep8_disable_show_diff=1

" Clojure dev stuff

" Reload current file and run its tests
nmap ,t :w<CR>:Require<CR>:RunTests<CR>   
autocmd FileType javascript.jsx nmap ,t :Dispatch npm test<CR>

" Reload all require'd files and run current file tests
nmap ,T :w<CR>:Require!<CR>:RunTests<CR>

" Reload current
nmap ,r :Require<CR>

" Reload all require'd files
nmap ,R :Require!<CR>

" Display source of current symbol
nmap ,s [d

" Shortcut to display source of provided symbol
nmap ,S :Source

" Display doc for current symbol
nmap ,d K

" Shortcut to display doc of provided symbol
nmap ,D :FindDoc

" Jump to source of current symbol
nmap <C-J> [<C-D>
autocmd FileType javascript.jsx nmap <C-J> <C-]>

" Open a repl
nmap <C-P> cqp

" Engage omni-complete
inoremap <C-C> <C-X><C-O>

" React dev stuff
let g:jsx_ext_required = 0
imap ,cl console.log(

" Git stuff with gitgutter
nmap ,g :set g:gitgutter_diff_base = 
nmap ,ggd :GitGutterDisable<CR>

" Shows all the TODOs and NOTEs and such
nmap ,tl :TaskList<CR>

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:paredit_mode = 0

let vim_markdown_preview_github=1

"au FileType sql setl formatprg=/usr/local/bin/pg_format\ -
let g:formatdef_pgformat="'/usr/local/bin/pg_format -'"
let g:formatters_sql = ['pgformat']

"reloads current file from disk
nmap ,rl :e!<CR>


autocmd FileType javascript nmap ,f :Prettier<CR>
autocmd FileType vue nmap ,f :Prettier<CR>
