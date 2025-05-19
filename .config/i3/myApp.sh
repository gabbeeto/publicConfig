#!/bin/bash

selection=$(echo "audio"$'\n'"brightness"$'\n'"input"$'\n'"monitor" | rofi -dmenu -p "Select Apps" -i)
echo $selection
if [ $selection == "audio" ]; then
  pavucontrol
elif [ $selection == "brightness" ]; then
 lxqt-config-brightness
elif [ $selection == "input" ]; then
  lxqt-config-input
elif [ $selection == "monitor" ]; then
  lxqt-config-monitor
fi

# echo ${listOfApp[0]}
# echo ${listOfApp[1]}
# echo ${listOfApp[2]}
# 
# for app in $listOfApp
# do
 
# done
