# +----+
# | cd |
# +----+
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
# alias rm='rm -i' # way to annoying

# ls modification
alias ls='ls --group-directories-first --human-readable --color'
alias la='ls  -a' # the upper group dir and color will get forwarded to these commands too
alias ll='ls  -l'
alias lal='ls -al'
alias lla='ls -al'

#battery 
alias battery='echo -e "Battery Percentage: $(cat /sys/class/power_supply/BAT*/capacity)\nBattery Status: $(cat /sys/class/power_supply/BAT*/status)"'

#connect an android device and pc
alias android='ssh -i $ANDROID_IDENTITY_FILE $ANDROID_IP -p $ANDROID_PORT'
alias pc='ssh -i $PC_IDENTITY_FILE $PC_USERNAME@$PC_IP'
