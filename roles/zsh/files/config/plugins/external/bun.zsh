source "$ZDOTDIR/utils/prepend_to_path.zsh"

export BUN_INSTALL="$XDG_DATA_HOME/bun"
prependToPath "$BUN_INSTALL/bin"

plug "${XDG_DATA_HOME}/bun/_bun" # autocompletion for bun
