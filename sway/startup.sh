SLEEP=2

mkdir -p /tmp/startup/

open_on_workspace() {
  swaymsg workspace number $1
  if [ ! -f /tmp/startup/$2 ]; then
    swaymsg "exec $3"
    touch /tmp/startup/$2
    sleep ${SLEEP}
  fi
}

open_on_workspace 7 signal signal-desktop
open_on_workspace 4 slack slack
open_on_workspace 2 foot main
open_on_workspace 1 discord discord
