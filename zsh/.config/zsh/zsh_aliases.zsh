# env variables for better commands
# export FZF_DEFAULT_COMMAND='ag -hidden --ignore={.cache,.cargo,.local,.mozilla} -g ""' 
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude={.git/,.cache/,.cargo/,.local/,.mozilla/,node_modules/,proc/,.venv/} --strip-cwd-prefix'
export FZF_DEFAULT_OPTS='--border=rounded --info=inline'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# +----+
# | cd |
# +----+
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# cli tools better alternatives
# alias find='fd' # replace find with the faster fd command that is written in rust
# alias grep='rg' # replace grep with the faster counter part rip grep written in rust
alias hg="sed 's/.*;//g' $HISTFILE | fzf | wl-copy"
alias fzfview='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias fzfv='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
# alias fzf='fzf --tmux 70%'

# +--------+
# | Neovim |
# +--------+
alias nv='nvim $(fzfview)'
alias n='nvim -c "lua require(\"telescope.builtin\").git_files()"'
alias vim='nvim'
alias vi='nvim'


#Pacman
alias pacf='pacman -Ssq | fzf -m --preview "pacman -Si {} | rg -v \"^(Groups|Architecture|Licenses|Conflicts With|Replaces)\" | bat --color=always --style=numbers --line-range=:500"'
# Unfortunately you need sudo for pacman ;-;
alias paci='sudo pacman -S $(pacf)'
alias pacd='sudo pacman -Rns $(pacman -Qeq | fzf -m --preview "pacman -Qi {} | bat --color=always --style=numbers --line-range=:500")'
alias pacu='paru' # Alternative: sudo pacman -Syyu

alias yay='paru'
# Swayimg
alias img='swayimg'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
# alias rm='rm -i' # way to annoying
#

# ls modification
alias ls='ls --group-directories-first --color'
alias la='ls  -a' # the upper group dir and color will get forwarded to these commands too
alias ll='ls  -l'
alias lal='ls -al'

# alias some="someFnc"
# someFnc() {
# echo "$CProcess Some Function $ColorOff" 2>&1 
# trap cleanup SIGINT
# echo "hi"
# }

#battery 
alias battery='echo -e "Battery Percentage: $(cat /sys/class/power_supply/BAT*/capacity)\nBattery Status: $(cat /sys/class/power_supply/BAT*/status)"'

#kill a program
function killapp(){
  kill $(ps -a | awk '{printf($1 "\t" $4 "\n")}' | rofi -dmenu | awk '{print $1}') 
}

# share files over the internet
alias share='curl -F"file=@$(fd . $HOME -H -E .local -E .cache -E .cargo -E .npm -E .ssh -E .mozilla -t f| rofi -dmenu -i)" -Fexpires=240 0x0.st | wl-copy'

# vscodium
alias code='codium'

#connect an android device and pc
alias android='ssh -i $ANDROID_IDENTITY_FILE $ANDROID_IP -p $ANDROID_PORT'
alias pc='ssh -i $PC_IDENTITY_FILE $PC_USERNAME@$PC_IP'

# cpp
alias gpp=g++

# neofetch
alias neofetch=fastfetch

#font info
alias fc-info='fc-query $(fc-list | fzf | sed "s/:.*//") | rg "(family|style|fontformat|fullname|file):" | sort'
alias fc-view='view $(fc-list | fzf | sed "s/:.*//")'

# lazy tui stuff
alias lg='lazygit'
alias ld='lazydocker' # since docker requires root privileges
alias db='nvim -c "DBUI"'

# +------+
# | TMUX |
# +------+
alias t='tmux'
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

alias hex='hexyl' # a hexadecimal file content viewer
# +--------+
# | Docker |
# +--------+
alias d='docker'
alias da='docker attach'
alias dbb='docker buildx build'
alias dc='docker-compose'
alias de='docker exec'
alias di='docker image'
alias dn='docker network'
alias ds='docker start'
alias dv='docker volume'

# +-----+
# | git |
# +-----+
#git porcelain aliases
alias g='git'
alias ga='git add --verbose'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gl='git -c core.pager="bat" log --no-color'
alias glg='git log --graph  --oneline --all'
alias glo='git log --oneline'
alias gp='git pull --no-edit'
alias gP='git push'
alias gr='git remote'
alias gs='git switch'


# +-------------------------+
# | Reserved single letters |
# +-------------------------+
# d -> docker
# g -> git
# n -> neovim
# t -> tmux
