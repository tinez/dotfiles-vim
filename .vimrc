set nocompatible

"--- use pathogen ---
execute pathogen#infect()

"--- various options ---
set history=200		
set ruler		
set showcmd		
set number
set scrolljump=8
set scrolloff=8
set dir=/tmp
set novisualbell
set t_vb=   
set termencoding=utf-8
set fileencodings=utf-8
set hidden
set backspace=indent,eol,start whichwrap+=<,>,[,]
set expandtab
set statusline=%<%f%h%m%r\ \x%02B\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2
set sessionoptions=curdir,buffers,tabpages
set tags+=~/.vim/tags/*/tags

"--- indentation options ---
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set smartindent

"--- color options ---
colorscheme kolor

"--- gui options ---
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guifont=Consolas\ 13

"--- wildcard options ---
set wildmenu
set wcm=<Tab> 

"--- syntax highlight options ---
au BufNewFile,BufRead *.qml set filetype=qml
let g:loaded_matchparen=1
syntax on

"--- plugin shortcuts ---
nmap <F9> :TagbarToggle<CR>
nmap <C-\> :tselect<CR>
noremap <silent> <F10> :BufExplorer<CR>
noremap <silent> <m-F10> :BufExplorerHorizontalSplit<CR>
noremap <silent> <c-F10> :BufExplorerVerticalSplit<CR>

"--- plugin options ---
filetype plugin on
filetype indent on

"--- various shortcuts ---
let mapleader = ","
set incsearch
set hlsearch
nmap \q :nohlsearch<CR>
nmap \o :set paste!<CR>
map <leader>s :vsplit<CR>
imap <S-Insert> <MiddleMouse>
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/
vmap < <gv
vmap > >gv
imap <Ins> <Esc>wq

"--- nerdtree options ---
:nmap \l :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 45
let g:NERDTreeWinPos = "right"

"--- autotag options ---
let g:autotagCtagsArgs = "--c++-kinds=+p --fields=+iaS --extra=+q" 

"--- screen ctrl+arrow fix ---
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

"--- supertab options ---
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"--- firefox auto-refresh ---
autocmd BufWriteCmd *.html,*.css,*.haml :call Refresh_browser()

function! Refresh_browser()
    if &modified
        write
        silent !refresh_firefox.sh
    endif
endfunction

"--- crontab fix for os x ---
autocmd filetype crontab setlocal nobackup nowritebackup

"--- per filetype options ---
au FileType yaml setl sw=2 sts=2 ts=2 et
au FileType c,h,cpp setl sw=2 sts=2 ts=2 et
au BufNewFile,BufRead *.js, *.html, *.css setl sw=2 sts=2 ts=2 et
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
