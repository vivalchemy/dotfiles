#!/usr/bin/env bash

include_dirs=(
    "$HOME/dotfiles"
    "$HOME/.local/bin"
)

tmuxifier_sessions=$(tmuxifier list-sessions)

if command -v fd &> /dev/null; then
    search_cmd="fd . --type=directory --max-depth=1 "
else
    search_cmd="find -mindepth 1 -maxdepth 1 -type d"
fi

if [[ $# -eq 1 ]]; then
    selected=$1
else
  selected=$($search_cmd ~/Projects ~/Public ~/dotfiles/roles/ ~/Public/testing | cat - <(echo -e "${include_dirs[@]} ${tmuxifier_sessions}" | tr " " "\n") | tac |  fzf --tmux  center,50%,40%)
fi

if [[ -z $selected ]]; then
    exit 0
fi

tmuxifier_file_template="${TMUXIFIER_LAYOUT_PATH:-$(which tmuxifier)/layouts}/${selected}.session.sh"
tmux_running=$(pgrep tmux)

if [[ -e $tmuxifier_file_template ]]; then
  tmuxifier load-session ${selected}
fi

selected_name=$(basename "$selected" | tr . _)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]]; then
    tmux attach -t $selected_name
else
    tmux switch-client -t $selected_name
fi
