theme="~/.config/rofi/scripts/power/theme.rasi"

shutdown="󰐥 Shutdown"
reboot=" Restart"
lock=" Lock"
suspend="󰤄 Sleep"
logout="󰍃 Logout"
yes="Yes"
no="No"

options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

confim_question="Are you sure?"

confirm_exit() {
  echo -e "$yes\n$no" | rofi -p "$confim_question" -dmenu -selected-row 0 -theme "$theme" 
}

chosen="$(echo -e $options | rofi -selected-row 0 -dmenu -theme "$theme")"

echo $chosen 

case $chosen in 
  $shutdown)
   
    confirmation=$(confirm_exit &)

    if [[ $confirmation == $yes ]]; then
      systemctl poweroff
    else
      exit 0
    
    fi
    ;;
  $reboot)
    confirmation=$(confirm_exit &)

    if [[ $confirmation == $yes ]]; then
      systemctl reboot
    else 
      exit 0

    fi 
    ;;
  $lock)
    confirmation=$(confirm_exit &)

    if [[ $confirmation == $yes ]]; then
      i3lock
    else
      exit 0

   fi
    ;;
  $suspend)
    confirmation=$(confirm_exit &)
    
    if [[ $confirmation == $yes ]]; then
      systemctl suspend
    else
      exit 0

    fi
    ;;
  $logout)
    confirmation=$(confirm_exit &)

    if [[ $confirmation == $yes ]]; then
        loginctl terminate-session $XDG_SESSION_ID
    else 
      exit 0
    
    fi 
    ;;

esac
