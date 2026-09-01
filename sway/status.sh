#!/bin/sh

read_cpu() {
    read -r _ u n s i r rest < /proc/stat
    echo "$u $n $s $i"
}

while true; do
    set -- $(read_cpu)
    u1=$1; n1=$2; s1=$3; i1=$4
    sleep 1
    set -- $(read_cpu)
    u2=$1; n2=$2; s2=$3; i2=$4

    du=$((u2-u1)); dn=$((n2-n1)); ds=$((s2-s1)); di=$((i2-i1))
    total=$((du+dn+ds+di))
    if [ "$total" -gt 0 ]; then
        cpu=$(( (du+dn+ds) * 100 / total ))
    else
        cpu=0
    fi

    ram=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
    wifi=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | awk -F: '$1=="yes"{print $2; exit}')
    bt=$(bluetoothctl show 2>/dev/null | awk -F': ' '/Powered: yes/{print "on"; found=1} END{if(!found) print "off"}')
    time=$(date '+%Y-%m-%d %H:%M:%S')
    battery=$(acpitool | awk -F'[:,%]' '/Battery #1/ {gsub(/ /,"",$3); print $3"%"}')

    [ -n "$wifi" ] || wifi="disconnected"
    [ -n "$battery" ] || battery="N/A"

    echo "CPU: ${cpu}% | RAM: $ram | WiFi: $wifi | BT: $bt | Battery: $battery | $time"
done
