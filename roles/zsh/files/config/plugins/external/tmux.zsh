source "$ZDOTDIR/utils/prepend_to_path.zsh"

export TMUXIFIER_LAYOUT_PATH="$XDG_DATA_HOME/tmux/sessions" #tmuxifier
prependToPath "$XDG_DATA_HOME/tmux/plugins/tmuxifier/bin"

# +---------+
# | ALIASES |
# +---------+
alias t='tmux_sessionizer.sh'
alias tmf='tmuxifier'
## sessions
alias tmx='tmuxifier load-session $(tmuxifier list-sessions | fzf --height=10 --layout=reverse)' # cause my brain is dumb
alias tmxn='tmuxifier new-session $(gum input --placeholder "Tmux Session Name")' # cause my brain is dumb
alias tmxe='tmuxifier edit-session $(tmuxifier list-sessions | fzf --height=10 --layout=reverse)' # cause my brain is dumb
alias tmxl='tmuxifier list-sessions' # cause my brain is dumb
alias tmxd='rm $TMUXIFIER_LAYOUT_PATH/$(tmuxifier list-sessions | fzf --preview "bat --color=always --style=numbers --line-range=:500 $TMUXIFIER_LAYOUT_PATH/{}.session.sh").session.sh'
# rm $TMUXIFIER_LAYOUT_PATH/$(tmuxifier list-sessions | fzf --preview "bat --color=always $TMUXIFIER_LAYOUT_PATH/{}.session.sh").session.sh

## windows
alias tmxw='tmuxifier load-window $(tmuxifier list-windows | fzf --height=10 --layout=reverse)' # cause my brain is dumb
alias tmxnw='tmuxifier new-window $(gum input --placeholder "Tmux Session Name")' # cause my brain is dumb
alias tmxew='tmuxifier edit-window $(tmuxifier list-windows | fzf --height=10 --layout=reverse)' # cause my brain is dumb
alias tmxlw='tmuxifier list-windows' # cause my brain is dumb
alias tmxdw='rm $TMUXIFIER_LAYOUT_PATH/$(tmuxifier list-windows | fzf --preview "bat --color=always --style=numbers --line-range=:500 $TMUXIFIER_LAYOUT_PATH/{}.window.sh").window.sh'

# +----------+
# | KEY MAPS |
# +----------+
bindkey -s "^ " "tmux_sessionizer.sh\n"
