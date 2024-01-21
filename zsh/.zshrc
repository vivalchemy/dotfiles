# constants
export HISTFILESIZE=10000
export HISTSIZE=10000
setopt INC_APPEND_HISTORY # command are directly entered in the HISTFILE instead of waiting for the shell to close
setopt HIST_FIND_NO_DUPS # removes the duplicates while searching
setopt HIST_IGNORE_ALL_DUPS # ignores all duplicates while writing in the hist file

# Add a directory to the PATH variable
addToPath ()
{
    if [ -d $1 ]; then
        export PATH=$1:$PATH
    fi
}

# execute a file before opening the zsh shell
sourceFile ()
{
    if [ -f $1 ]; then
        source $1
    fi
}


sourceFile "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" # zsh autosuggestions
sourceFile "${XDG_CONFIG_HOME}/zsh/.aliases" # aliases for zsh

sourceFile "${XDG_CONFIG_HOME}/zsh/Prompt"
sourceFile "${XDG_CONFIG_HOME}/zsh/plugins/supercharge"

addToPath "$HOME/dotfiles/scripts" # custom scripts location
neofetch
