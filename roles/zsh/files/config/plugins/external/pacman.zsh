fuzzy-pac(){
  pacman -Ssq | fzf -m --preview "pacman -Si {} | rg -v \"^(Groups|Architecture|Licenses|Conflicts With|Replaces)\" | bat --color=always --style=numbers --line-range=:500"
}

alias pacf='pacman -Si $(fuzzy-pac)'
# Unfortunately you need sudo for pacman ;-;
alias paci='sudo pacman -S $(fuzzy-pac)'
alias pacd='sudo pacman -Rns $(pacman -Qeq | fzf -m --preview "pacman -Qi {} | bat --color=always --style=numbers --line-range=:500")'
alias yay='paru'
