include() {
  # Include the file if it exists
  if [[ -f "$ZDOTDIR/$1.zsh" ]]; then
    source "$ZDOTDIR/$1.zsh"
  # Include the directory if the init.zsh file exists
  elif [[ -f "$ZDOTDIR/$1/init.zsh" ]]; then
    source "$ZDOTDIR/$1/init.zsh"
  else
    echo -e "File or directory '$1' not found in '$ZDOTDIR'\nTried: source '$ZDOTDIR/$1.zsh' and source '$ZDOTDIR/$1/init.zsh'"
  fi
}

