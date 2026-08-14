SLEEP=5

mkdir -p /tmp/startup/

open_on_workspace() {
  swaymsg workspace number $1
  if [ ! -f /tmp/startup/$2 ]; then
    swaymsg "exec $3"
    touch /tmp/startup/$2
    sleep ${SLEEP}
  fi
}

open_on_workspace 9 firefox firefox
open_on_workspace 7 signal signal-desktop
open_on_workspace 6 librewolf librewolf
open_on_workspace 5 reviewer foot
open_on_workspace 4 slack slack
open_on_workspace 2 main foot
open_on_workspace 1 discord discord
