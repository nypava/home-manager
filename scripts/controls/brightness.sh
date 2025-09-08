#!/bin/sh

get_brightness() {
  brightnessctl g | python3 -c 'import sys; import json; currentbri = int(json.load(sys.stdin)); print(int(currentbri/80000*100))'
}

send_notification() {
  echo $(brightnessctl g)
  brightness=$(get_brightness)
  dunstify -a "changebrightness"  -r 2593 -u normal -h int:value:"$brightness" "Brightness: ${brightness}%"
}

case $1 in
  up)
    brightnessctl -q set 1%+
    send_notification
    ;;
  down)
    brightnessctl --min-val=2 -q set 1%-
    send_notification
    ;;
esac
