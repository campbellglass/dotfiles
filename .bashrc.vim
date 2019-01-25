# Vim specific bashrc settings

# Vim variables
VIMDIR="${HOME}/.vim"
SWAPFILES="${VIMDIR}/swapfiles"

# .vimrc editing
alias vimrc='vim ~/.vimrc'
#alias revimrc='not sure how to do this actually'

# Vim swap management
alias vimclearswap='rm -r ${SWAPFILES}'
vimmakeswap () { # Makes vim swapfile dir if not present
    if [ ! -d "${SWAPFILES}" ]; then
        mkdir --parents "${SWAPFILES}"
    fi
}
vimrefreshswap () { # Clears and remakes vim swapfile dir
    vimclearswap
    vimmakeswap
}

vimmakeswap
