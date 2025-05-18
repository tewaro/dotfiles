UDATE=$(date -u +'%Y-%m-%d %H:%M')
DATE=$(date +'%Y-%m-%d %I:%M:%S %p')
BAT=$(cat /sys/class/power_supply/BAT*/capacity)
AC=$(cat /sys/class/power_supply/AC*/online)
printf "AC: ${AC} BAT: ${BAT}%%\t\tUTC: ${UDATE} Here: ${DATE}\n"
