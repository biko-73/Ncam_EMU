#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

remove_tmp() {
    rm -rf /tmp/ecm.info /tmp/ecm0.info /tmp/pid.info /tmp/cardinfo /tmp/ncam*
}

case "$1" in
start)
    remove_tmp
    sleep 1
    /usr/bin/ncam -d -c /etc/tuxbox/config/ncam.conf &
    /usr/bin/revcamv2 -d -c /etc/tuxbox/config/RevcamV2/oscam.conf &
    sleep 5
    ;;
stop)
    touch /tmp/ncam.kill
    sleep 3
    killall -9 ncam 2>/dev/null
    killall -9 revcamv2 2>/dev/null
    sleep 2
    remove_tmp
    ;;
*)
    $0 stop
    exit 1
    ;;
esac

exit 0
