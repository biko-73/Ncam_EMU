#!/bin/sh
Action=$1
OSD="Ncam 13.0"

cam_clean () {
	rm -rf /tmp/ecm.info /tmp/script.info /tmp/pid.info /tmp/cardinfo /tmp/cam.info /tmp/debug.txt /tmp/ecm0.info /tmp/mbox.ver /tmp/newcs.pid /tmp/share.info /tmp/share.onl /tmp/stat.info
}

cam_up () {
	cam_clean
	sleep 2
        /usr/bin/ncam -c /etc/tuxbox/config/ &
}

cam_down() {
	sleep 4
	killall -9  ncam
	sleep 2
	cam_clean
}

if test "$Action" = "cam_up" ; then
	cam_up
elif test "$Action" = "cam_down" ; then
	cam_down
elif test "$Action" = "cam_res" ; then	
	cam_down
	cam_up
fi
exit 0




