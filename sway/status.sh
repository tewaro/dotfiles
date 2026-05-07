UDATE=$(date -u +'%Y-%m-%d %H:%M')
DATE=$(date +'%Y-%m-%d %I:%M:%S %p')
BAT=$(cat /sys/class/power_supply/BAT*/capacity)
AC=$(cat /sys/class/power_supply/AC*/online)
WPCTL_VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOLUME=$(echo ${WPCTL_VOL} | awk '{print $2 * 100}')
MUTE=$(echo ${WPCTL_VOL} | awk 'NF < 3 {print "U"}; NF >= 3 {print "M"}')
SINK=$(wpctl inspect @DEFAULT_AUDIO_SINK@ |grep node.name | sed 's/.*HiFi__//' | sed 's/__sink.*//')
printf "${SINK}:${MUTE}:${VOLUME}\t\tAC: ${AC} BAT: ${BAT}%%\t\tUTC: ${UDATE} Here: ${DATE}\n"
