#!/bin/sh
########################################
######      Edited by RAED        ######
########################################
#emuname=ncam 13.0
#ecminfofile=ecm.info

remove_tmp () {
	rm -rf /tmp/ecm.info /tmp/ecm0.info /tmp/pid.info /tmp/cardinfo /tmp/ncam*
}

case "$1" in
	start)
	remove_tmp
	sleep 1
	/usr/bin/ncam -d -c /etc/tuxbox/config/ncam.conf &
	sleep 5
	;;
	stop)
	touch /tmp/ncam.kill
	sleep 3
	killall -9 ncam 2>/dev/null
	sleep 2
	remove_tmp
	;;
	*)
	$0 stop
	exit 1
	;;
esac

exit 0


