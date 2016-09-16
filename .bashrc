# BashRC round 2
# Campbell Glass

echo 'Running .bashrc'

### GENERAL SETTINGS ###
# Default Editor
export EDITOR='vim'

# Path modification
export PATH=$PATH:/usr/local/bin

### USEFUL ALIASES ###
# ls family
alias ls='ls --color=auto'
alias la='ls -a --color=auto'

# tmux family
alias newmux='tmux new-session -s'
alias attachmux='tmux attach -t'
alias detachmux='tmux detach'
alias listmux='tmux list-sessions'
alias movemux='tmux move-window -t'
shiftmux () { tmux move-window -s $1 -t $2; }
swapmux () { # Swaps window numbering of two args in tmux
  SWAP_WINDOW=100;
  shiftmux $1 $SWAP_WINDOW;
  shiftmux $2 $1;
  shiftmux $SWAP_WINDOW $2;
  unset SWAP_WINDOW;
}

# .dotfiles family
alias dotfiles='cd ~/.dotfiles'

# .bash_profile family
alias bashprofile='vim ~/.bash_profile'
alias rebashprofile='source ~/.bash_profile'

# .bashrc family
alias bashrc='vim ~/.bashrc'
alias rebashrc='source ~/.bashrc'

# .vimrc family
alias vimrc='vim ~/.vimrc'
#alias revimrc='not sure how to do this actually'

# .tmux.conf family
alias muxconf='vim ~/.tmux.conf'
alias remuxconf='tmux source-file ~/.tmux.conf'

# Go setup
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export GOPATH=$HOME/extrahop/depot/extrahop/go:$HOME/extrahop/depot/vendor/golibs:$HOME/go

### COLOR SETTINGS ###
# Colorize and customize the PS1
# from: http://bashrcgenerator.com/
export PS1="[\[$(tput sgr0)\]\[\033[38;5;183m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]\[\033[38;5;178m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;201m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\]:[\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]]\[\033[38;5;15m\]]>\[$(tput sgr0)\]"

# Set terminal to 256 color mode?
# from: http://vim.wikia.com/wiki/256_colors_in_vim
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

if [ -f ~/.bashrc.local ];
then
    source ~/.bashrc.local
fi

### VOLUME SETTINGS ###
# Open sound mixer application
alias mixer='alsamixer'
# Increase by 2%
alias louder='amixer -q sset Master 2%+'
# Increase by 2% $1 times
louderx () {
    for i in `seq 1 $1`;
    do
        louder
    done
}
# Decrease by 2% $1 times
alias quieter='amixer -q sset Master 2%-'
quieterx () {
    for i in `seq 1 $1`;
    do
        quieter
    done
}

