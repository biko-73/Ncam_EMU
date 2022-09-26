#!/bin/sh
########################################
######      Edited by RAED        ######
########################################

remove_tmp () {
	rm -rf /tmp/ecm.info /tmp/pid.info /tmp/cardinfo /tmp/mg* /tmp/ncam*
}

case "$1" in
	start)
	remove_tmp
	/usr/bin/ncam &
	sleep 3
	;;
	stop)
	killall -9 ncam
	remove_tmp
	sleep 2
	;;
	*)
	$0 stop
	exit 1
	;;
esac

exit 0
