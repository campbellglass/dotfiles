# BashRC round 2
# Campbell Glass

echo 'Running .bashrc'

### USEFUL ALIASES ###
# ls family
alias ls='ls --color=auto'
alias la='ls -a --color=auto'

# tmux family
alias newmux='tmux new-session -s'
alias attachmux='tmux attach -t'
alias listmux='tmux list-sessions'

# .bashrc family
alias bashrc='vim ~/.bashrc'
alias rebashrc='source ~/.bashrc'

# .vimrc family
alias vimrc='vim ~/.vimrc'
#alias revimrc='not sure how to do this actually'

# .tmux.conf family
alias muxconf='vim ~/.tmux.conf'
#alias remuxconf='not sure how to do this actually'


### COLOR SETTINGS ###
# Colorize and customize the PS1
# from: http://bashrcgenerator.com/
export PS1="[\[$(tput sgr0)\]\[\033[38;5;183m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]\[\033[38;5;178m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;201m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\]:[\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]>\[$(tput sgr0)\]"

# Set terminal to 256 color mode?
# from: http://vim.wikia.com/wiki/256_colors_in_vim
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

