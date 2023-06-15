#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

CAMNAME="RevcamV2_Ncam"

remove_tmp() {
    rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/.ncam /tmp/*share* /tmp/*.pid* /tmp/*sbox* /tmp/ncam.* /tmp/*.ncam
}

case "$1" in
start)
    echo "[SCRIPT] $1: $CAMNAME"
    remove_tmp
    touch /tmp/.emu.info
    echo ncam >/tmp/.emu.info
    /usr/bin/ncam --config-dir /etc/tuxbox/config --daemon --pidfile /tmp/ncam.pid --restart 2 --utf8 &
    /usr/bin/revcamv2 --wait 0 --config-dir /etc/tuxbox/config/RevcamV2 --daemon --pidfile /tmp/revcamv2.pid --restart 2 --utf8 &
    ;;
stop)
    echo "[SCRIPT] $1: $CAMNAME"
    killall -9 ncam 2>/dev/null
    killall -9 revcamv2 2>/dev/null
    remove_tmp
    ;;
restart)
    $0 stop
    sleep 2
    $0 start
    exit
    ;;
*)
    $0 stop
    exit 0
    ;;
esac

exit 0
