if [ "true" == $(eww get bar-show) ]; then
  eww close bar && eww open bar-btn && eww update bar-show=false &
else
  eww close bar-btn && eww open bar && eww update bar-show=true &
fi
