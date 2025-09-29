paci() {
	pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
}

pacf() {
	pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro pacman -Si
}

# Function to search and remove packages using pacman
pacd() {
	pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
}

# Function to search and install packages using paru
pari() {
	paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S
}

parf() {
	paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -Si
}

# Unfortunately you need sudo for pacman ;-;
alias yay='paru'
