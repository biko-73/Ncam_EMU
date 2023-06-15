#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

CAMNAME="RevcamV2_Ncam"

remove_tmp() {
    rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/*ncam*
}
echo "[SCRIPT] $1: $CAMNAME"
start_cam() {
    remove_tmp
    sleep 2
    /usr/bin/ncam -d -c /etc/tuxbox/config/ncam.conf 2>/dev/null &
    /usr/bin/revcamv2 -d -c /etc/tuxbox/config/RevcamV2/oscam.conf 2>/dev/null &
}
echo "[SCRIPT] $1: $CAMNAME"
stop_cam() {
    remove_tmp
    killall -9 ncam 2>/dev/null
    killall -9 revcamv2 2>/dev/null
}
case "$1" in
start)
    start_cam
    ;;
stop)
    stop_cam
    ;;
restart)
    $0 stop
    $0 start
    ;;
*) ;;

esac

exit 0
