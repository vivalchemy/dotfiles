alias pacf='pacman -Ssq | fzf -m --preview "pacman -Si {} | rg -v \"^(Groups|Architecture|Licenses|Conflicts With|Replaces)\" | bat --color=always --style=numbers --line-range=:500"'
# Unfortunately you need sudo for pacman ;-;
alias paci='sudo pacman -S $(pacf)'
alias pacd='sudo pacman -Rns $(pacman -Qeq | fzf -m --preview "pacman -Qi {} | bat --color=always --style=numbers --line-range=:500")'
alias pacu='paru' # Alternative: sudo pacman -Syyu

alias yay='paru'
