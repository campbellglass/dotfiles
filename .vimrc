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

" Plug Setup End
call plug#end()

