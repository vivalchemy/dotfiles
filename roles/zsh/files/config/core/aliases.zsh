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
alias ls='eza -lh --group-directories-first --icons=auto'
alias l='ls -1'
alias la='ls  -a' # the upper group dir and color will get forwarded to these commands too
alias lt='eza --tree --level=2 --long --icons=auto --git'
alias lta='lt -a'

# cat
alias cat='bat'

#battery 
alias battery='echo -e "Battery Percentage: $(cat /sys/class/power_supply/BAT*/capacity)\nBattery Status: $(cat /sys/class/power_supply/BAT*/status)"'

#connect an android device and pc
alias android='ssh -i $ANDROID_IDENTITY_FILE $ANDROID_IP -p $ANDROID_PORT'
alias pc='ssh -i $PC_IDENTITY_FILE $PC_USERNAME@$PC_IP'
