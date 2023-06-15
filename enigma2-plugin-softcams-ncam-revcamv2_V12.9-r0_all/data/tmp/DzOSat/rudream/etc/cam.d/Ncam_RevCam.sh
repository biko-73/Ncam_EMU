#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"
#v.1.6 211.611.6.26 by RAED
#v.1.11.611.611.6.77 by RAED
#v.11.6 111.611.6.97 by RAED

#profile for oscam

usage() {
    echo "Usage: $0 {start|stop|status|restart|reload}"
}

if [ $# -lt 1 ]; then usage; fi
action=$1

case "$action" in

start)
    echo "Start cam daemon: RevcamV2_Ncam"
    /usr/bin/ncam --config-dir /etc/tuxbox/config --daemon --pidfile /tmp/ncam.pid --restart 2 --utf8 &
    /usr/bin/revcamv2 --wait 0 --config-dir /etc/tuxbox/config/RevcamV2 --daemon --pidfile /tmp/revcamv2.pid --restart 2 --utf8 &
    echo " RevcamV2_Ncam."
    ;;

stop)
    echo "Stopping cam daemon: RevcamV2_Ncam"
    while [ -n "$(pidof ncam)" ]; do
        kill -9 "$(pidof ncam)"
        kill -9 "$(pidof revcamv2)"
    done
    rm -f /tmp/*.info /tmp/camd.socket /tmp/*.list /tmp/*.pid
    echo "."
    ;;

status) ;;

\
    restart | reload)
    $0 stop
    sleep 2
    $0 start
    ;;

*)
    usage
    ;;

esac

exit 0
