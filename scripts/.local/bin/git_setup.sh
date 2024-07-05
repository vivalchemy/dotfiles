#!/usr/bin/env bash
#
# deps
# ripgrep gum git

# styles
SOff="\033[0m"       # [S]tyle [Off]
CProcess="\033[0;34m" # blue
CError="\033[0;31m" # red 
CWarning="\033[0;33m" # yellow 
CSuccess="\033[0;32m" # green
SBold="\033[1m" # [S]tyle [Bold]

# initial a git repo
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  if gum confirm "Do you want to initial a git repository?"; then
    git init &>/dev/null &&
    echo -e "${CProcess}Initialised a git repo${SOff}" ||
    exit 1;
  else
    exit 1;
  fi;
fi;

# add a remote repository
if [[ -z $(git remote) ]]; then 
  if $(gum confirm "Do you want to add a remote repository?"); then
    remoteRepoUrl=$(gum input --placeholder "Remote Repo Url/Ssh")
    remoteRepoAlias=$(gum input --placeholder "Remote Alias(empty for 'origin')")
    [[ -z $remoteRepoAlias ]] && remoteRepoAlias="origin"
    git remote add $remoteRepoAlias $remoteRepoUrl
  else
    exit 1;
  fi;
fi
