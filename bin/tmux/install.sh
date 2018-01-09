#!/bin/bash

declare -a MUX_SCRIPTS=(
    "templatemux"
)

link_mux_script () {
    # Check args
    if [ -z $1 ]; then
        echo "Usage: $0 [script_name]"
        exit 1
    fi

    SCRIPT_NAME=$1
    ln -fs -T $HOME/.dotfiles/bin/tmux/$SCRIPT_NAME $HOME/bin/$SCRIPT_NAME
}

main() {
    echo "Installing custom mux scripts"
    for script_name in "${MUX_SCRIPTS[@]}";
    do
        echo "    Installing ${script_name}"
        link_mux_script "${script_name}"
    done
}

main
