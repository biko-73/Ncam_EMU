#!/bin/sh
########################################
######       EDit By RAED         ######
########################################

CAMNAME="Ncam 13.0"


remove_tmp () {
    rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/*ncam*
}
    echo "[SCRIPT] $1: $CAMNAME"
    start_cam () 
    { 
    remove_tmp
	sleep 2
	/usr/bin/ncam -d -c /etc/tuxbox/config/ncam.conf & 2>/dev/null
    }
	echo "[SCRIPT] $1: $CAMNAME"
	stop_cam () 
    {
	remove_tmp
    killall -9 ncam 2>/dev/null
	    }
case "$1" in  
    start) 
        start_cam 
        ;; 
    stop) 
        stop_cam 
        ;; 
    restart) 
        $0 stop 
        $0 start 
        ;; 
    *)
 
    esac


exit 0
