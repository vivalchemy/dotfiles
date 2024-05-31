#!/bin/zsh

autoload -Uz vcs_info
autoload -U colors && colors

# start the timer when the command is executed
preexec() {
  TIMER_START=$(date +%s)
} 

# calculate the time taken by the previous command
precmd() {
  if [ -n "$TIMER_START" ]; then
    TIMER_END=$(date +%s)
    ELAPSED_TIME=$((TIMER_END - TIMER_START))

        # Calculate hours, minutes, and seconds
        ((hours=ELAPSED_TIME/3600, minutes=(ELAPSED_TIME%3600)/60, seconds=ELAPSED_TIME%60))

        # Format the time components
        if [ "$hours" -gt 0 ]; then
          ELAPSED_TIME_FORMATTED=$(printf "%02dh%02dm%02ds" "$hours" "$minutes" "$seconds")
        elif [ "$minutes" -gt 0 ]; then
          ELAPSED_TIME_FORMATTED=$(printf "%02dm%02ds" "$minutes" "$seconds")
        elif [ "$seconds" -gt 0 ]; then
          ELAPSED_TIME_FORMATTED=$(printf "%02ds" "$seconds")
        fi

        unset TIMER_START
  fi
}

zstyle ':vcs_info:*' enable git 

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst


zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  git status --porcelain | grep '??' &> /dev/null ; then
  hook_com[staged]+='!' # signify new files with a bang
fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"

#Set the prompt
autoload -Uz add-zsh-hook
add-zsh-hook precmd set_prompt


set_prompt() {
  #  ┌┘└┐

  # ╭─ ╰─
  PROMPT="
%(?:%{$fg_bold[green]%}╭─ :%{$fg_bold[red]%}╭─ )%B%{$fg[white]%}%n%{$reset_color%}%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%}) %{$fg_bold[cyan]%}${PWD/#$HOME/ }
%(?:%{$fg_bold[green]%}╰─ :%{$fg_bold[red]%}╰─ )"
  # PROMPT="%B%{$fg[yellow]%}%n%{$reset_color%}---%{$fg_bold[cyan]%}( ${PWD/#$HOME/ } )%(?:%{$fg_bold[green]%}--> :%{$fg_bold[red]%}--> )%{$reset_color%}"
  # PS1='%n@%m:%~$ '
  RPROMPT="\$vcs_info_msg_0_ "
  if [ -n "$ELAPSED_TIME" ]; then
    RPROMPT+="%(?:%F{14}${ELAPSED_TIME_FORMATTED}:%F{9}${ELAPSED_TIME_FORMATTED})%f"
    # else
    #   RPROMPT+="%(?:%F{14}pass:%F{9}fail)%f"
  fi
}

set_prompt
