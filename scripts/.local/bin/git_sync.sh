# check if it is a git repo
if ! git rev-parse --is-inside-work-tree &>/dev/null;then
  $(gum confirm "Do you want to initial a git repository?") &&
  git init &>/dev/null &&
  echo -e "${CProcess}Initialised a git repo${SOff}" ||
  exit 1;
fi;

# select git branch
if [[ ! -z $(git branch) ]]; then
  selectedBranch=$( [[ $(git branch | wc -l) -eq 1 ]] && git branch | tr -d "*" || git branch | gum choose | tr -d "*" )
  git checkout $selectedBranch &>/dev/null && 
  echo -e "${CProcess}Switching current branch to $selectedBranch${SOff}"
fi

# stage all the changes
git status | rg "Untracked" &>/dev/null &&
gum confirm "Do you want to Stage all you changes?" &&
gum spin --spinner dot --title "Adding all the files to staging area..." -- git add . &&
echo -e "${CProcess}Added all the files to Staging area ${SOff}"


# commit all the changes
git status | rg "Changes to be committed" &>/dev/null &&
gum confirm "Do you want to Commit all you changes?" &&
commitTitle=$(gum input --placeholder "Title of the commit") &&
commitDescription=$(gum write --placeholder "Description of the commit") &&
# Convert this to a gum panel to view the commit details
gum pager --soft-wrap "
Author: $(git config --get user.name) <$(git config --get user.email)>
Date: $(date)
Commit message: $commitTitle
Commit description: $commitDescription
$(git diff --staged | bat --color=always --show-all --file-name="Commit Changes")
" &&
echo -e "$commitTitle\n$commitDescription" &&
gum confirm "Commit changes?" &&
gum spin --spinner dot --title "Committing all the files..." -- git commit -m "$commitTitle" -m "$commitDescription" &&
echo -e "${CProcess}Committed all the files${SOff}"

# to check if remote exists
if [[ -z $(git remote) ]]; then
  if gum confirm "Do you want to add a remote repository?"; then
    remoteRepoUrl=$(gum input --placeholder "Remote Repo Url/Ssh")
    remoteRepoAlias=$(gum input --placeholder "Remote Alias(empty for 'origin')")
    [[ -z $remoteRepoAlias ]] && remoteRepoAlias="origin"
    git remote add $remoteRepoAlias $remoteRepoUrl
  else
    exit 1;
  fi;
fi;

# Pull all the changes
gum confirm "Do you want to pull changes?" &&
remoteRepoRef=$( [[ $(git remote | wc -l) -eq 1 ]] && git remote || git remote | gum choose )  &&
remoteRepoBranch=$( [[ $(git branch | wc -l) -le 1 ]] && echo "main" || git branch | gum choose | tr -d "*" ) &&
gum spin --spinner globe --title "Pulling from remote..." -- git pull $remoteRepoRef $remoteRepoBranch &&
echo -e "${CProcess}Pulled latest commits from $remoteRepoBranch $(git remote -v | rg $remoteRepoRef | head -n1)${SOff}" ||
echo "Didn't pull from remote"

# Push all the changes
gum confirm "Do you want to push changes?" &&
remoteRepoRef=$( [[ $(git remote | wc -l) -eq 1 ]] && git remote || git remote | gum choose ) &&
remoteRepoBranch=$( [[ $(git branch | wc -l) -le 1 ]] && echo "main" || git branch | gum choose | tr -d "*" ) &&
gum spin --spinner globe --title "Pushing to remote..." -- git push $remoteRepoRef $remoteRepoBranch &&
echo -e "${CProcess}Pushed to $remoteRepoBranch $(git remote -v | rg $remoteRepoRef | head -n1)${SOff}" ||
echo "Didn't push to remote"
