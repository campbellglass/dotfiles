" Copyright Campbell Glass 2016 or whatever

"** Plug Package Manager Section ***
" Obtained from https://github.com/junegunn/vim-plug
" Automatic install script
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" Plug Setup
call plug#begin('~/.vim/plugged')

" Go support in vim
Plug 'fatih/vim-go'
au FileType go nmap <Leader>gd <Plug>(go-def-vertical)

" Plug Setup End
call plug#end()


"** Vim Settings Section **"
" Set directory for vim swap files
:set directory=$HOME/.vim/swapfiles//

"* Indentation
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

