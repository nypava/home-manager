theme="~/.config/rofi/scripts/power/theme.rasi"

wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

connected=$(nmcli -fields WIFI g)

if [[ "$connected" =~ "enabled" ]]; then
	toggle="󰖪  Disable Wi-Fi"

elif [[ "$connected" =~ "disabled" ]]; then
	toggle="󰖩  Enable Wi-Fi"
fi

chosen_network=$(echo -e "$toggle\n$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 1 -theme $theme )

read -r chosen_id <<< "${chosen_network:3}"

case  "$chosen_network" in 
  "")
  exit
  ;;

  "󰖩  Enable Wi-Fi" )
  	nmcli radio wifi on
  ;;

  "󰖪  Disable Wi-Fi") 
  	nmcli radio wifi off
  ;;

  *) 
    success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."

	  saved_connections=$(nmcli -g NAME connection)

	  if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
	  	nmcli connection up id "$chosen_id" | grep "successfully" && notify-send "Connection Established" "$success_message"
	  else

		  nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send "Connection Established" "$success_message"
    fi
esac
