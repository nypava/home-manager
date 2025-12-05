
#!/usr/bin/env bash

set_nix_proxy() {
  address="$1"
  port="$2"
  [[ ! -d "/run/systemd/system/nix-daemon.service.d" ]] && sudo mkdir /run/systemd/system/nix-daemon.service.d
  cat << EOF | sudo tee /run/systemd/system/nix-daemon.service.d/override.conf > /dev/null
[Service]
Environment="http_proxy=http://$address:$port"
Environment="https_proxy=http://$address:$port"
Environment="all_proxy=http://$address:$port"
EOF
  sudo systemctl daemon-reload && sudo systemctl restart nix-daemon
}

unset_nix_proxy() {
  [[ -d "/run/systemd/system/nix-daemon.service.d" ]] && sudo rm -rf /run/systemd/system/nix-daemon.service.d
  sudo systemctl daemon-reload && sudo systemctl restart nix-daemon
}

if [[ $1 == 'local' || $1 == 'proxy' ]]; then 
  if [ $1 == 'local' ]; then
    address=$(ip route get 1 | sed -n 's/.*via \([0-9.]\+\).*/\1/p')
    port=44355
  else
    address=173.212.215.22
    port=1080
  fi
  set_nix_proxy "$address" "$port"
elif [[ $1 == "none" ]]; then
  unset $(env | grep -oPi ".*(proxy)")
  unset_nix_proxy
fi




