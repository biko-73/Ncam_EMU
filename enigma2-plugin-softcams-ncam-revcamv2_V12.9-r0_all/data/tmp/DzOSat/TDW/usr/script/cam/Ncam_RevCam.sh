#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

OSD="RevcamV2_Ncam"
PID=$(pidof ncam)
Action=$1

cam_clean() {
    rm -rf /tmp/*.info* /tmp/*.tmp*
}

cam_handle() {
    if test -z "${PID}"; then
        cam_up
    else
        cam_down
    fi
}

cam_down() {
    killall -9 ncam
    killall -9 revcamv2
    sleep 2
    cam_clean
}

cam_up() {
    /usr/bin/cam/ncam -c /etc/tuxbox/config/ncam.conf &
    /usr/bin/revcamv2 -c /etc/tuxbox/config/RevcamV2/oscam.conf &
}

if test "$Action" = "cam_res"; then
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
