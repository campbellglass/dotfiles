#!/bin/bash

# .bashrc stuff
echo "Linking .bashrc"
ln -fns /home/ctmg/.dotfiles/.bashrc /home/ctmg/.bashrc

# .vimrc stuff
echo "Linking .vimrc"
ln -fns /home/ctmg/.dotfiles/.vimrc /home/ctmg/.vimrc

# .tmux.conf stuff
echo "Linking .tmux.conf"
ln -fns /home/ctmg/.dotfiles/.tmux.conf /home/ctmg/.tmux.conf

