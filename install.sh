#!/bin/bash

# Settings to refactor
DOTFILES=".dotfiles"
DOTFILES_PATH="${HOME}/${DOTFILES}"

# .bashrc stuff
echo "Linking .bashrc"
ln -fns "${DOTFILES_PATH}/.bashrc.master" "${HOME}/.bashrc"
echo "Linking .bashrc.misc"
ln -fns "${DOTFILES_PATH}/.bashrc.misc" "${HOME}/.bashrc.misc"

# .vimrc stuff
echo "Linking .vimrc"
ln -fns "${DOTFILES_PATH}/.vimrc" "${HOME}/.vimrc"
if [ ! -d "${HOME}/.vim" ]; then
    mkdir "${HOME}/.vim"
fi
if [ ! -d "${HOME}/.vim/swapfiles" ]; then
    mkdir "${HOME}/.vim/swapfiles"
fi

# .tmux.conf stuff
echo "Linking .tmux.conf"
ln -fns "${DOTFILES_PATH}/.tmux.conf" "${HOME}/.tmux.conf"

# link bash_profile to bashrc for tmux loading
# TODO: Make this work if .bash_profile is already present
# Currently, it breaks if .bash_profile is already present
if [ ! -f ${HOME}/.bash_profile ]; then
    ln -fns "${DOTFILES_PATH}/.bashrc.master" "${HOME}/.bash_profile"
fi

# tmux custom scripts stuff
# "${DOTFILES_PATH}/bin/tmux/install.sh"
