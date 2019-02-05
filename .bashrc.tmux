#/bin/bash

testmux () {
  # Create session
  renameterminal "${STANLEE_DIR}"

  tmux new-session -d -A -c "${STANLEE}" -s "${STANLEE_DIR}"

  tmux new-window -k -d -c "${STANLEE}" -n "git" -t "${STANLEE_DIR}:0"
  tmux new-window -k -d -c "${STANLEE}" -n "asdf" -t "${STANLEE_DIR}:1"

  tmux attach-session -t "${STANLEE_DIR}"
}

# Creates a tmux session with my preferred layout for the arbitrary repo
depotmux () {
  # Create session
  renameterminal "${STANLEE_DIR}"

  tmux new-session -d -A -c "${STANLEE}" -s "${STANLEE_DIR}"

  # Create git window
  tmux new-window -k -d -c "${STANLEE}" -n "git" -t "${STANLEE_DIR}:0"
  tmux send-keys -t "${STANLEE_DIR}:0" "git hist" C-m

  # Create vim window
  tmux new-window -k -d -c "${STANLEE}" -n "vim" -t "${STANLEE_DIR}:1"
  # tmux send-keys -t "${STANLEE_DIR}:1" "vim" C-m

  # Create grep window
  tmux new-window -k -d -c "${STANLEE}" -n "grep" -t "${STANLEE_DIR}:5"
  tmux send-keys -t "${STANLEE_DIR}:5" "git grep storage" C-m

  # Create stage window
  tmux new-window -k -d -c "${STANLEE}" -n "stage" -t "${STANLEE_DIR}:7"
  tmux send-keys -t "${STANLEE_DIR}:7" "make start" C-m

  tmux attach-session -t "${STANLEE_DIR}"
}


