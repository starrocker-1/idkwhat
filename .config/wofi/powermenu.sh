#!/bin/bash

lock=" Lock"
logout="󰍃 Logout"
poweroff="⏻ Poweroff"
reboot=" Reboot"
sleep=" Suspend"
 
selected_option=$(echo "$poweroff
$reboot
$sleep
$logout" | wofi -dip "Bye!! Have a nice day! " -W 550 -H 215 )

#if [ "$selected_option" == "$lock" ]
#then
#  echo "You have nothing set for this options!!"
if [ "$selected_option" == "$logout" ]
then
 loginctl terminate-user `whoami`
elif [ "$selected_option" == "$poweroff" ]
then
  systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
  systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
  systemctl suspend
fi
