#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

# DOMICA image
remove_tmp() {
    rm -rf /tmp/*.tmp* /tmp/*.info*
}

case "$1" in
start)
    remove_tmp
    /usr/bin/ncam -d -c /etc/tuxbox/config &
    /usr/bin/revcamv2 -d -c /etc/tuxbox/config/RevcamV2 &
    ;;
stop)
    killall -9 ncam 2>/dev/null
    killall -9 revcamv2 2>/dev/null
    sleep 2
    remove_tmp
    ;;
*)
    $0 stop
    exit 0
    ;;
esac

exit 0
