#!/bin/sh
########################################
######      Edited by RAED        ######
########################################


EMUNAME="ncam 13.0"
EMUBIN="ncam"

remove_tmp ()
{
	[ -e /tmp/ecm.info ] && rm -rf /tmp/ecm.info
	[ -e /tmp/.tmp ] && rm -rf /tmp/.tmp
}
	
case "$1" in
	start)
		echo "[SCRIPT] $1: $EMUNAME"
		if [ `pidof $EMUBIN | wc -l` == 1 ]; then
			echo "[0;31m $EMUBIN already running...[0m"
		else
                	/usr/camd/$EMUBIN -- -d -c /etc/tuxbox/config/ncam.conf > /dev/null 2>&1 &
		fi
		;;
	stop)
		echo "[SCRIPT] $1: $EMUNAME"
		if [ `pidof $EMUBIN | wc -l` == 0 ]; then
			echo "[0;31m $EMUBIN not running...[0m"
		else
			kill `pidof $EMUBIN`
			sleep 2
		fi	        
		if [ `pidof $EMUBIN | wc -l` == 1 ]; then
			kill -9 `pidof $EMUBIN`
		fi
		remove_tmp
		;;
        restart)
                $0 stop
                sleep 2
                $0 start
		;;
     	*)
		echo "[0;32m Usage: $0 start|stop|restart[0m"
		exit 1
		;;
esac

exit 0
