# Make zsh XDG-compliant
mkdir -p "$XDG_STATE_HOME/zsh" # Create the directory if it doesn't exist
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# constants
export HISTFILESIZE=10000 # Maximum number of lines in the history file
export HISTSIZE=10000     # Maximum number of lines in the history
export SAVEHIST=$HISTSIZE # Maximum number of lines in the history file
HISTDUP=erase            # How to handle duplicate entries in the history

# History options
setopt INC_APPEND_HISTORY      # Write commands to the history file as they are entered
setopt HIST_FIND_NO_DUPS       # Avoid duplicates while searching history
setopt HIST_IGNORE_SPACE       # Ignore commands starting with space
setopt SHAREHISTORY            # Share history between zsh instances
