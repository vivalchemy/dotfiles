alias zel='zellij'

function zr () { zellij run --name "$*" -- zsh -c "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -c "$*";}
function zri () { zellij run --name "$*" --in-place -- zsh -c "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
function zei () { zellij edit --in-place "$*";}

# +----------+
# | KEY MAPS |
# +----------+
bindkey -s "^ " "zellij_sessionizer.sh\n"
