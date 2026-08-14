UDATE=$(date -u +'%Y-%m-%d %H:%M')
DATE=$(date +'%Y-%m-%d %I:%M:%S %p')
BAT=$(cat /sys/class/power_supply/BAT*/capacity)
AC=$(cat /sys/class/power_supply/AC*/online)
WPCTL_VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOLUME=$(echo ${WPCTL_VOL} | awk '{print $2 * 100}')
MUTE=$(echo ${WPCTL_VOL} | awk 'NF < 3 {print "U"}; NF >= 3 {print "M"}')
SINK=$(wpctl inspect @DEFAULT_AUDIO_SINK@ |grep node.name | sed 's/.*HiFi__//' | sed 's/__sink.*//' | sed 's/.*alsa_output\.//' | sed 's/pci-.*\.//' | sed 's/"//')
MAX_BRIGHT=$(cat /sys/class/backlight/intel_backlight/max_brightness)
BRIGHT_DIGIT=$(python3 -c "ans = ${MAX_BRIGHT}
count = 0
while (ans != 0):
  ans //= 10
  count += 1
print(count)
")
BRIGHT=$(cat /sys/class/backlight/intel_backlight/brightness | xargs printf "%0*d" ${BRIGHT_DIGIT})
printf "BRIGHT:${BRIGHT}:${MAX_BRIGHT}\t\t${SINK}:${MUTE}:${VOLUME}\t\tAC: ${AC} BAT: ${BAT}%%\t\tUTC: ${UDATE} Here: ${DATE}\n"
