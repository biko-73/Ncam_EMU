#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

remove_tmp() {
    rm -rf /tmp/ecm.info /tmp/pid.info /tmp/cardinfo /tmp/mg* /tmp/ncam*
}

case "$1" in
start)
    remove_tmp
    /var/bin/ncam -c /etc/tuxbox/config &
    /usr/bin/revcamv2 -c /etc/tuxbox/config/RevcamV2 &
    sleep 3
    ;;
stop)
    killall -9 ncam
    killall -9 revcamv2
    remove_tmp
    sleep 2
    ;;
*)
    $0 stop
    exit 1
    ;;
esac

exit 0
