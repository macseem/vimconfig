" version 1.1
set t_Co=256
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
" when you start searching text with /, search is performed at every new character insertion
set number
set incsearch
set nopaste
set autoindent
set foldenable
set foldmethod=syntax
set fileformats=unix,dos
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" docblock comments are continued when a newline is inserted
set comments=sr:/*,mb:*,ex:*/
syntax on
filetype on
filetype plugin on
" check syntax with Ctrl + L
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
autocmd FileType phtml noremap <C-L> :!/usr/bin/env php -l %<CR>
colorscheme Yule 
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
set dictionary+=~/.vim/dic/php/funclist.txt
nmap <c-a> :cs find g <c-r>=expand("<cword>")<cr><cr>
"map w <Plug>CamelCaseMotion_w "
"map b <Plug>CamelCaseMotion_b "
"map e <Plug>CamelCaseMotion_e "
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
imap <S-Tab> <C-o><<
map <F12> :NERDTreeToggle<CR>
nnoremap <S-F12> :set nonumber!<CR>
set mouse=a
nmap <C-@> /\c
vmap <C-@> /\c
imap <C-@> <C-c>/\c
