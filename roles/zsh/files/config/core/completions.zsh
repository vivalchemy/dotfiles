source "$ZDOTDIR/utils/prepend_to_fpath.zsh"

autoload -Uz compinit

prependToFpath "$XDG_DATA_HOME/zsh/completions"

# Set up a cache for completion files
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion::complete:*' use-cache on

# Enable command auto-correction and matching
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
zle_highlight=('paste:none')

if [[ ! -e "${ZDOTDIR:-$HOME}/.zcompdump" || $(find "${ZDOTDIR:-$HOME}/.zcompdump" -mmin +1440 -print) ]]; then
  # If the file doesn't exist or it's older than 24 hours, recompute completions
  compinit
else
  # Otherwise, load the dump without integrity checks
  compinit -C
fi

# Path completion
zstyle ':completion:*' path-guard-characters '/'

# Enable filename completion
zstyle ':completion:*' file-list-dirs first

# Define the history file path
zstyle ':completion:*' history-path "$HISTFILE"
