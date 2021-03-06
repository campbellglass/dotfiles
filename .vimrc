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

" Run Python Black on save
Plug 'ambv/black'

Plug 'vim-python/python-syntax'
let g:python_highlight_all = 0
let g:pymode_python = 'python3'
let g:pymode_lint_on_write = 0
let b:syntastic_mode = 'passive'

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
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>

" Syntastic
Plug 'vim-syntastic/syntastic'
" Suggested default settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" ShellCheck using Syntastic
" let g:syntastic_sh_checkers = ['syntastic-sh-shellcheck']
let g:syntastic_sh_checkers = []

" Plug Setup End
call plug#end()


"** Vim Settings Section **"
" Set directory for vim swap files
" TODO: Create this directory if not present
:set directory=$HOME/.vim/swapfiles/

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
"* Split opening
set splitbelow
set splitright

"* Automatically resize splits on window resize
autocmd VimResized * wincmd =

"* Colors
syntax enable
set background=dark
highlight Normal ctermbg=None


"* Line length
highlight ColorColumn ctermbg=0 guibg=#eee8d5
set textwidth=80
set colorcolumn=+1

"* Appearance
set number                      " Turn on line numbers
set ruler                       " Turn on line, column counter
set nowrap

if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

