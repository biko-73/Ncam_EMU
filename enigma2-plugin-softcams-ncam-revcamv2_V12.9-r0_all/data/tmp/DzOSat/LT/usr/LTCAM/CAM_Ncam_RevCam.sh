#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

CAMNAME="RevcamV2_Ncam"

usage() {
    echo "Usage: $0 {start|stop|restart|reload}"
}

if [ $# -lt 1 ]; then usage; fi
action=$1

case "$action" in
start)
    echo "[SCRIPT] $1: $CAMNAME"
    /usr/bin/ncam -d -c /etc/tuxbox/config/ncam.conf &
    /usr/bin/revcamv2 -d -c /etc/tuxbox/config/RevcamV2/oscam.conf &
    ;;
stop)
    echo "[SCRIPT] $1: $CAMNAME"
    killall -9 ncam
    killall -9 revcamv2 2>/dev/null
    ;;
restart | reload)
    $0 stop
    $0 start
    ;;
*)
    usage
    ;;
esac

exit 0
