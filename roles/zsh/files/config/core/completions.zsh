source "$ZDOTDIR/utils/prepend_to_fpath.zsh"

prependToFpath "$XDG_DATA_HOME/zsh/completions"
# Set up a cache for completion files
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion::complete:*' use-cache on
autoload -Uz compinit
compinit # too much hassle to use -d
# compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"  # Using XDG cache directory for completion dumps

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Set the maximum number of items to display in completion menu
zstyle ':completion:*' menu select=1

# Enable command auto-correction and matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu yes select

# Path completion
zstyle ':completion:*' path-guard-characters '/'

# Enable filename completion
zstyle ':completion:*' file-list-dirs first

# Define the history file path
zstyle ':completion:*' history-path "$HISTFILE"
