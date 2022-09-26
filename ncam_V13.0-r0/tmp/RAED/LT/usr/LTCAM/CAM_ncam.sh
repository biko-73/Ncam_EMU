#!/bin/sh
########################################
######      Edited by RAED        ######
########################################

CAMNAME="Ncam 13.0"

usage()
{
	echo "Usage: $0 {start|stop|restart|reload}"
}

if [ $# -lt 1 ] ; then usage ; break ; fi
action=$1

case "$action" in
start)
	echo "[SCRIPT] $1: $CAMNAME"
	/usr/bin/ncam -d -c /etc/tuxbox/config/ncam.conf &
	;;
stop)
	echo "[SCRIPT] $1: $CAMNAME"
	killall -9 ncam
	;;
restart|reload)
	$0 stop
	$0 start
	;;
*)
	usage
	;;
esac

exit 0
