Bat() {
  x=$(cat /sys/class/power_supply/BAT1/capacity)
  echo "BAT $x%"
}

Time() {
  x=$(date +"%I:%M %p")
  echo $x
}

Date() {
  x=$(date +"%b %a %D")
  echo $x
}

BAR() {
  echo "[$(Bat)] [$(Time)] [$(Date)]"
}

while :
do
  # xsetroot -name "$(BAR)"
  echo "$(BAR)"
  sleep 5
done
