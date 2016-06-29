" version 1.1
set t_Co=256
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
imap <S-Tab> <C-o><<

set background=dark

" when you start searching text with /, search is performed at every new character insertion
set number
set incsearch
set ignorecase
set nopaste
set smartindent
set visualbell
set wildmenu

set foldmethod=syntax
set fileformats=unix,dos

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" this will show -- INSERT -- label at the bottom of the window
set showmode

" docblock comments are continued when a newline is inserted
set comments=sr:/*,mb:*,ex:*/
set comments=sr:/**,mb:*,ex:*/

syntax on
filetype on
filetype plugin on

" check syntax with Ctrl + L
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
autocmd FileType phtml noremap <C-L> :!/usr/bin/env php -l %<CR>

colorscheme Yule 

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e

map <F10> :NERDTreeToggle<CR>
noremap <S-F10> :set nonumber!<CR>

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

