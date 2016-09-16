" Copyright Campbell Glass 2016 or whatever
" For further reference, see github.com/tgrosinger/dotfiles

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

command Nogofmt let g:go_fmt_autosave = 0
command Yesgofmt let g:go_fmt_autosave = 1

" Ctrl-p Fuzzy File Matching
" Mostly cut/paste from github.com/tgrosinger/dotfiles
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

" Tmux navigation integration
Plug 'christoomey/vim-tmux-navigator'

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

"* Leader things
set wildmenu                    " Show a menu rather than auto-completing
let mapleader = ","
let g:mapleader = ","

"** Splits
"* Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"* Split opening
set splitbelow
set splitright

"* Tmux navigation integration
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>

"* Colors
syntax enable
set background=dark
"colorscheme solarized

