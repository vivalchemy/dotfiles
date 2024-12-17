function killapp(){
  kill $(ps -a | awk '{printf($1 "\t" $4 "\n")}' | rofi -dmenu | awk '{print $1}') 
}
