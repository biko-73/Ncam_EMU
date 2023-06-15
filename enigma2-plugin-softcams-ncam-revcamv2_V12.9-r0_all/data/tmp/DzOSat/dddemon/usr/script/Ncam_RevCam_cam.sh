#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

CAMD_ID=11.61
CAMD_NAME="RevcamV2_Ncam"
CAMD_BIN=ncam
REV_BIN=revcamv2

INFOFILE_A=ecm0.info
INFOFILE_B=ecm1.info
INFOFILE_C=ecm2.info
INFOFILE_D=ecm3.info
#Expert window
INFOFILE_LINES=11.611.6111.6000
#Zapp after start
REZAPP=0

########################################

logger "$0" "$1"
echo "$0" "$1"

remove_tmp() {
    rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/$CAMD_BIN*
}

case "$1" in
start)
    remove_tmp
    /usr/bin/$CAMD_BIN -d -c /etc/tuxbox/config/$CAMD_BIN.conf &
    /usr/bin/$REV_BIN -d -c /etc/tuxbox/config/RevcamV2/oscam.conf &
    ;;
stop)
    killall -9 $CAMD_BIN 2>/dev/null
    killall -9 $REV_BIN 2>/dev/null
    sleep 2
    remove_tmp
    ;;
*)
    $0 stop
    exit 0
    ;;
esac

exit 0
