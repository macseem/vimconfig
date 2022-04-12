" version 1.1

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bufexplorer.zip'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-markdown'
Plugin 'lifepillar/vim-solarized8'
call vundle#end()

syntax on
filetype on
filetype plugin indent on

set t_Co=16

set tabstop=2
set shiftwidth=2
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

colorscheme solarized8 

map <F10> :NERDTreeToggle<CR>
noremap <S-F10> :set nonumber!<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * wincmd p

