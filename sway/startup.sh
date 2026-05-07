
BIRDSEYE="https://grafana.cfdata.org/d/ee7pph8244l4wc/edgeworker-birdseye-global-metrics-copy?orgId=1"
KIBANA="https://kibana.cfdata.org/goto/78e28d560218b5c9db71a86dd5e06b9e"
SENTRY="https://sentry10.cfdata.org/organizations/cloudflare/issues/?project=204&statsPeriod=1h"
SLOS="https://grafana.cfdata.org/d/ce7ppybdumznkf/edgeworker-runtime-slos?orgId=1"
JIRA="https://jira.cfdata.org/secure/Dashboard.jspa"
GCHAT="https://mail.google.com/chat/u/0/#chat/home"
SLEEP=2

mkdir -p /tmp/startup/
swaymsg workspace number 7
if [ ! -f /tmp/startup/global-metrics ];  then 
  swaymsg "exec google-chrome-stable --new-window ${BIRDSEYE}"
  touch /tmp/startup/global-metrics
  sleep ${SLEEP}
fi

if [ ! -f /tmp/startup/kibana ]; then
  swaymsg "exec google-chrome-stable ${KIBANA}" 
  touch /tmp/startup/kibana
  sleep ${SLEEP}
fi

if [ ! -f /tmp/startup/slos ]; then 
  swaymsg "exec google-chrome-stable --new-window ${SLOS}"
  touch /tmp/startup/slos
  sleep ${SLEEP}
fi

if [ ! -f /tmp/startup/sentry ]; then 
  swaymsg "exec google-chrome-stable ${SENTRY}"
  touch /tmp/startup/sentry
  sleep ${SLEEP}
fi

swaymsg workspace number 2
if [ ! -f /tmp/startup/jira ]; then 
  swaymsg "exec google-chrome-stable --new-window ${JIRA}" 
  touch /tmp/startup/jira
  sleep ${SLEEP}
fi

swaymsg workspace number 3
if [ ! -f /tmp/startup/chat ] ; then
  swaymsg "exec google-chrome-stable --new-window ${GCHAT}"
  touch /tmp/startup/chat
  sleep ${SLEEP}
fi

swaymsg workspace number 1
if [ ! -f /tmp/startup/code ]; then
  swaymsg "exec foot"
  touch /tmp/startup/code
  sleep ${SLEEP}
fi

swaymsg workspace number 4
if [ ! -f /tmp/startup/console ]; then
  swaymsg "exec foot"
  touch /tmp/startup/console
  sleep ${SLEEP}
fi
swaymsg workspace number 1
