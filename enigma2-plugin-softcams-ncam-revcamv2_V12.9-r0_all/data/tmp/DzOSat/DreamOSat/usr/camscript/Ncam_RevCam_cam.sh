#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

OSD="RevcamV2_Ncam"
CAM="ncam"
REV="revcamv2"
PID=$(pidof $CAM)
Action=$1

cam_clean() {
    rm -rf /tmp/*.info* /tmp/.$CAM /tmp/*.pid
}

cam_handle() {
    if test -z "${PID}"; then
        cam_up
    else
        cam_down
    fi
}

cam_down() {
    killall -9 $CAM
    killall -9 $REV
    sleep 2
    cam_clean
}

cam_up() {
    /usr/bin/$CAM -c /etc/tuxbox/config/ &
    /usr/bin/$REV -c /etc/tuxbox/config/RevcamV2 &
}

if test "$Action" = "cam_startup"; then
    if test -z "${PID}"; then
        cam_down
        cam_up
    else
        echo "$CAM already running, exiting..."
    fi
elif test "$Action" = "cam_res"; then
    cam_down
    cam_up
elif test "$Action" = "cam_down"; then
    cam_down
elif test "$Action" = "cam_up"; then
    cam_up
else
    cam_handle
fi

exit 0
