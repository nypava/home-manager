
#!/bin/sh

get_volume() {
  amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

is_mute() {
  amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

send_notification() {
  volume=$(get_volume)
  dunstify -a "changeVolume" -r 2593 -u normal -h int:value:"$volume" "Volume: ${volume}%"
}

sendmute() {
  dunstify -a "changeVolume"  -r 2593 -u normal "Volume: Mute"
}

case $1 in
  up)
    amixer pulse set Master on > /dev/null
    amixer sset Master 5%+ > /dev/null
    send_notification
    ;;
  down)
    amixer set Master on > /dev/null
    amixer sset Master 5%- > /dev/null
    send_notification
    ;;
  mute)
    amixer sset Master 1+ toggle > /dev/null
    if is_mute; then
      sendmute
    else
      send_notification
    fi
    ;;
esac
