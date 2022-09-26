#!/bin/sh
#v.1.6 213.013.0.26 by RAED
#v.1.13.013.013.0.77 by RAED
#v.13.0 113.013.0.97 by RAED

#profile for ncam

usage()
{
	echo "Usage: $0 {start|stop|status|restart|reload}"
}

if [ $# -lt 1 ] ; then usage ; break ; fi
action=$1

case "$action" in

start)
	echo -n "Start cam daemon: ncam"
	/usr/bin/ncam
	echo " ncam."
		;;

stop)
	echo -n "Stopping cam daemon: ncam"
	while [ -n "`pidof ncam`" ] ; do
		kill -9 `pidof ncam`
	done
	rm -f /tmp/*.info /tmp/camd.socket /tmp/*.list /tmp/*.pid
	echo "."
	;;

status)
	;;

restart|reload)
	$0 stop
	sleep 2
	$0 start
	;;

*)
	usage
	;;

esac

exit 0
