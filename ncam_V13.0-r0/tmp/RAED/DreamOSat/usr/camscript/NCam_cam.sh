#!/bin/sh
#### "*******************************************"
#### "*            By RAED - Fairbird           *"
#### "*******************************************"

OSD="Ncam 13.0"
CAM="ncam"
PID=`pidof $CAM`
Action=$1

cam_clean () {
		rm -rf /tmp/*.info* /tmp/.ncam /tmp/*.pid
}

cam_handle () {
		if test	-z "${PID}"	; then
				cam_up;
		else
				cam_down;
		fi;
}

cam_down ()	{
		killall	-9 $CAM
		sleep 2
		cam_clean
}

cam_up () {
		/usr/bin/$CAM -c /etc/tuxbox/config/ &
}

if test	"$Action" =	"cam_startup" ;	then
	if test	-z "${PID}" ; then
		cam_down
		cam_up
	else
		echo "$CAM already running, exiting..."
	fi
elif test	"$Action" =	"cam_res" ;	then
		cam_down
		cam_up
elif test "$Action"	= "cam_down" ; then
		cam_down
elif test "$Action"	= "cam_up" ; then
		cam_up
else
		cam_handle
fi

exit 0
