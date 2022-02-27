function ide() {
  tmux split-window -h
  tmux select-pane -t 0
  tmux resize-pane -R 100
  tmux select-pane -t 1
  tmux split-window -v
  tmux resize-pane -D 40
  tmux select-pane -t 0
  tmux split-window -v
  tmux resize-pane -D 40
  tmux split-window -h

  tmux select-pane -t 0
  vim
}
