" version 1.1

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'stanangeloff/php.vim' "syntax
Plugin 'shawncplus/phpcomplete.vim' "omni-completion
Plugin 'bufexplorer.zip'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['html', 'php', 'bash=sh']

Plugin 'arnaud-lb/vim-php-namespace'
function! IPhpInsertUse()
    call PHPInsertUse()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
Plugin 'vim-php/tagbar-phpctags.vim'
let g:tagbar_phpctags_bin='$HOME/.vim/bin/phpctags'
let g:tagbar_phpctags_memory_limit = '1024M'
autocmd VimEnter * if isdirectory( './.git' ) | !$HOME/.vim/bin/phpctags -R --exclude=kahlan/spec --memory=-1 -f ./.git/tags | endif
Plugin 'easytags.vim'
let g:easytags_file = './.git/tags'
set tags=./.git/tags
let g:easytags_dynamic_files = 1
let g:easytags_languages = {
\    'php':{
\        'cmd': '$HOME/.vim/bin/phpctags',
\        'args': [
\            '--exclude=kahlan/spec',
\            '--memory=-1'
\        ],
\        'fileoutput_opt': '-f',
\        'stdout_opt': '-f-',
\        'recurse_flag': '-R'
\    }
\}

call vundle#end()

syntax on
filetype on
filetype plugin indent on

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
set visualbell "blink instead of beep
set wildmenu

set foldmethod=syntax
set fileformats=unix,dos

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" this will show -- INSERT -- label at the bottom of the window
set showmode

" check syntax with Ctrl + L
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
autocmd FileType phtml noremap <C-L> :!/usr/bin/env php -l %<CR>

colorscheme darcula

map <F10> :NERDTreeToggle<CR>
noremap <S-F10> :set nonumber!<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * wincmd p

