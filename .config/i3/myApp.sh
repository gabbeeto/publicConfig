#!/bin/bash

selection=$(echo "audio"$'\n'"brightness"$'\n'"wifi" | rofi -dmenu -p "Select Apps" -i)
echo $selection
if [ $selection == "audio" ]; then
  pavucontrol
elif [ $selection == "brightness" ]; then
  brightnessctl set $(zenity --scale --title="Brightness" --percentage)
elif [ $selection == "wifi" ]; then
  nm-connection-editor
fi

# echo ${listOfApp[0]}
# echo ${listOfApp[1]}
# echo ${listOfApp[2]}
# 
# for app in $listOfApp
# do
 
# done
