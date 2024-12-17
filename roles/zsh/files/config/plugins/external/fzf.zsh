export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude={.git/,.cache/,.cargo/,.local/,.mozilla/,node_modules/,proc/,.venv/} --strip-cwd-prefix'
export FZF_DEFAULT_OPTS='--border=rounded --info=inline'

plug "Aloxaf/fzf-tab" # improves tab completion

# fzf completions
source <(fzf --zsh)

zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

alias hg="sed 's/.*;//g' ${HISTFILE:-$HOME/.zsh_history} | fzf --tac --height 40% | wl-copy"
alias fzfview='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias fzfv='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

#font info
alias fc-info='fc-query $(fc-list | fzf | sed "s/:.*//") | rg "(family|style|fontformat|fullname|file):" | sort'
alias fc-view='view $(fc-list | fzf | sed "s/:.*//")'
