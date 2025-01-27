# Make zsh XDG-compliant
mkdir -p "$XDG_STATE_HOME/zsh"   # Create the directory if it doesn't exist
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# constants
export HISTFILESIZE=10000        # Maximum number of lines in the history file
export HISTSIZE=10000            # Maximum number of lines in the history
export SAVEHIST=$HISTSIZE        # Maximum number of lines in the history file
export HISTDUP=erase                    # How to handle duplicate entries in the history

# History options
setopt INC_APPEND_HISTORY        # Write commands to the history file as they are entered
setopt HIST_FIND_NO_DUPS         # Avoid duplicates while searching history
setopt HIST_IGNORE_SPACE         # Ignore commands starting with space
setopt SHAREHISTORY              # Share history between zsh instances
setopt APPEND_HISTORY            # Don't clear the history file when shell exits

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
