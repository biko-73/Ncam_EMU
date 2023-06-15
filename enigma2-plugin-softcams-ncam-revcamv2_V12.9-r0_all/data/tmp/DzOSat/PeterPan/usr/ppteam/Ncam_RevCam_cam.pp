#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

NAME="RevcamV2_Ncam"

remove_tmp() {
    rm -rf /tmp/*ncam* /tmp/camd.socket /tmp/pid.info /tmp/ecm*.info /tmp/cardinfo /tmp/*cam*.pid /tmp/cam.kill
}

case "$1" in
start)
    echo "[SCRIPT] $1: $NAME"
    remove_tmp
    sleep 1
    /usr/bin/ncam -d /etc/tuxbox/config &
    /usr/bin/revcamv2 -d /etc/tuxbox/config/RevcamV2 &
    sleep 1
    pidof ncam >/tmp/ncam.pid
    ;;
stop)
    echo "[SCRIPT] $1: $NAME"
    kill 2>/dev/null "$(cat 2>/dev/null /tmp/ncam.pid)"
    sleep 1
    killall -9 ncam 2>/dev/null
    killall -9 revcamv2 2>/dev/null
    remove_tmp
    ;;
*)
    $0 stop
    exit 1
    ;;
esac

exit 0
