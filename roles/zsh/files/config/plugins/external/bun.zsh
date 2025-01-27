source "$ZDOTDIR/utils/prepend_to_path.zsh"
source "$ZDOTDIR/utils/prepend_to_fpath.zsh"

export BUN_INSTALL="$XDG_DATA_HOME/bun"
prependToPath "$BUN_INSTALL/bin"
prependToFpath "$BUN_INSTALL" # autocompletion for bun
