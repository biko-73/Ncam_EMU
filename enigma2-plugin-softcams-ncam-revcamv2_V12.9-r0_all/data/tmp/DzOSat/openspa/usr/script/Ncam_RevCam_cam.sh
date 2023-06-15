#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

CAMD_ID=11.65
CAMD_NAME="RevcamV2_Ncam"

INFOFILE_A=ecm.info
INFOFILE_B=ecm1.info
INFOFILE_C=ecm2.info
INFOFILE_D=ecm3.info
INFOFILE_E=ecm4.info
INFOFILE_F=ecm5.info
#Expert window
INFOFILE_LINES=11.611.6111.6000
#Zapp after start
REZAPP=0

########################################

logger "$0" "$1"
echo "$0" "$1"

remove_tmp() {
    rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/*mbox* /tmp/*share* /tmp/*.pid* /tmp/*sbox* /tmp/*ncam*
}

case "$1" in
start)
    remove_tmp
    /usr/bin/ncam -S -c /etc/tuxbox/config &
    /usr/bin/revcamv2 -c /etc/tuxbox/config/RevcamV2 &
    ;;
stop)
    killall -9 ncam 2>/dev/null
    killall -9 revcamv2 2>/dev/null
    sleep 2
    remove_tmp
    ;;
*)
    $0 stop
    exit 0
    ;;
esac

exit 0
