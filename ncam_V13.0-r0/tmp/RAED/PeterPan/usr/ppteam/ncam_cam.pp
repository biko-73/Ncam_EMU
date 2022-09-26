#!/bin/sh 
########################################
######      Edited by RAED        ######
########################################

NAME="ncam_13.0"

remove_tmp () {
	rm -rf /tmp/*ncam* /tmp/camd.socket /tmp/pid.info /tmp/ecm*.info /tmp/cardinfo /tmp/*cam*.pid /tmp/cam.kill
}

case "$1" in
	start)
		echo "[SCRIPT] $1: $NAME"
		remove_tmp
		sleep 1
		/usr/bin/ncam &
		sleep 1
		pidof ncam > /tmp/ncam.pid
		;;
	stop)
		echo "[SCRIPT] $1: $NAME"
		kill 2>/dev/null `cat 2>/dev/null /tmp/ncam.pid`
		sleep 1
		killall -9 ncam 2>/dev/null
		remove_tmp
		;;
	*)
		$0 stop
		exit 1
		;;
esac

exit 0
