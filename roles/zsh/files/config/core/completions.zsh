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
for dump in "${ZDOTDIR:-$HOME}/.zcompdump"(N.mh+24); do
  compinit # too much hassle to use -d
# compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"  # Using XDG cache directory for completion dumps
done
compinit -C

# Path completion
zstyle ':completion:*' path-guard-characters '/'

# Enable filename completion
zstyle ':completion:*' file-list-dirs first

# Define the history file path
zstyle ':completion:*' history-path "$HISTFILE"
