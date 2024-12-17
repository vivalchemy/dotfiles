# share files over the internet
alias share='curl -F"file=@$(fd . $HOME -H -E .local -E .cache -E .cargo -E .npm -E .ssh -E .mozilla -t f| rofi -dmenu -i)" -Fexpires=240 0x0.st | wl-copy'
