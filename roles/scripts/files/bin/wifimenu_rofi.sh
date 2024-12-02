#!/usr/bin/env bash

notify-send "Getting list of available Wi-Fi networks..." -i /usr/share/icons/Papirus-Dark/32x32/devices/network-wireless.svg
# Get a list of available wifi connections and morph it into a nice-looking list
wifi_list=$(
  nmcli --fields "IN-USE,SSID,SECURITY,BARS" device wifi list | \
  sed 1d | \
  sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d" | \
  sed 's/ *$//g' | \
  sed 's/\*\*\*\*$/󰤨/g' | sed 's/\*\*\*$/󰤥/g' | sed 's/\*\*$/󰤢/g' | sed 's/\*$/󰤟/g' | sed 's/_* $//g'
)
  # sed 's/▂▄▆█/󰤨/g' | sed 's/▂▄▆/󰤥/g' | sed 's/▂▄/󰤢/g' | sed 's/▂/󰤟/g' | sed 's/_* $//g'

connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
	toggle="󰖪  Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
	toggle="󰖩  Enable Wi-Fi"
fi

# Use rofi to select wifi network
chosen_network=$(echo -e "$toggle\n$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 1 -p "Wi-Fi SSID: " )
# Get name of connection

if [ "$chosen_network" = "" ]; then
	exit
elif [ "$chosen_network" = "󰖩  Enable Wi-Fi" ]; then
	nmcli radio wifi on
  nmcli device wifi list --rescan yes &
  notify-send "Wifi Turn On" -i /usr/share/icons/Papirus-Dark/32x32/devices/network-wireless.svg
elif [ "$chosen_network" = "󰖪  Disable Wi-Fi" ]; then
	nmcli radio wifi off
  notify-send "Wifi Turned Off" -i /usr/share/icons/Papirus-Dark/32x32/devices/network-wireless.svg
else
  chosen_id=$(echo "${chosen_network:3}" | sed 's/  */ /g' | sed 's/^ *//g' | sed 's/ *$//g')
  chosen_id="${chosen_id:0:-4}"
	# Message to show when connection is activated successfully
  	success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
	# Get saved connections
	saved_connections=$(nmcli -g NAME connection)
	if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
		nmcli connection up id "$chosen_id" | grep "successfully" && notify-send "Connection Established" "$success_message" -i /usr/share/icons/Papirus-Dark/32x32/devices/network-wireless.svg
	else
		if [[ "$chosen_network" =~ "" ]]; then
			wifi_password=$(rofi -dmenu -p "Password: " )
		fi
		nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send "Connection Established" "$success_message" -i /usr/share/icons/Papirus-Dark/32x32/devices/network-wireless.svg
    fi
fi
