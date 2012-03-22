:syntax on
set si
set sw=4
set sts=4
set noet
set nu
set enc=utf8

autocmd BufNewFile *.c 0r ~/.vim/skeletons/skeleton.c
autocmd BufNewFile *.h 0r ~/.vim/skeletons/skeleton.h
autocmd BufNewFile Makefile 0r ~/.vim/skeletons/skeleton.mk
autocmd BufNewFile *.sh 0r ~/.vim/skeletons/skeleton.sh

filetype on
filetype plugin on

nn <silent> <F8> :TlistToggle<CR>
let Tlist_Sort_Type = "name"
let mapleader=","
map <Leader>n <plug>NERDTreeTabsToggle<CR>
