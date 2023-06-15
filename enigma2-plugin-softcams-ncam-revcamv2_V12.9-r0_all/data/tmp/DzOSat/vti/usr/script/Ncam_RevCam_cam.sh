#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

CAMNAME="RevcamV2_Ncam"

remove_tmp() {
    rm -rf /tmp/cainfo.* /tmp/camd.* /tmp/sc.* /tmp/*.info* /tmp/*.tmp*
    [ -e /tmp/.emu.info ] && rm -rf /tmp/.emu.info
    [ -e /tmp/ncam.mem ] && rm -rf /tmp/ncam.mem
    [ -e /tmp/ncam.mem ] && rm -rf /tmp/ncam.mem
}

case "$1" in
start)
    echo "[SCRIPT] $1: $CAMNAME"
    remove_tmp
    touch /tmp/.emu.info
    echo $CAMNAME >/tmp/.emu.info
    /usr/bin/ncam -b -r 2 -c /etc/tuxbox/config &
    /usr/bin/revcamv2 -b -r 2 -c /etc/tuxbox/config/RevcamV2 &
    ;;
stop)
    echo "[SCRIPT] $1: $CAMNAME"
    kill "$(pidof ncam)"
    kill "$(pidof revcamv2)"
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
