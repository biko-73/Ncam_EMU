#!/bin/sh
########################################
######      Edited by RAED        ######
########################################


CAMD_ID=713.0
CAMD_NAME="ncam 13.0"
CAMD_BIN=ncam

INFOFILE_A=ecm0.info
INFOFILE_B=ecm1.info
INFOFILE_C=ecm2.info
INFOFILE_D=ecm3.info
INFOFILE_E=ecm4.info
INFOFILE_F=ecm5.info
#Expert window
INFOFILE_LINES=13.013.0113.0000
#Zapp after start
REZAPP=0

########################################

logger $0 $1
echo $0 $1

remove_tmp () {
rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/.ncam /tmp/*share* /tmp/*.pid* /tmp/*sbox* /tmp/ncam.* /tmp/*.ncam
}

case "$1" in
  start)
  remove_tmp
  /usr/bin/ncam -d -c /etc/tuxbox/config/ncam.conf &
  ;;
  stop)
  killall -9 ncam 2>/dev/null
  sleep 2
  remove_tmp
  ;;
  *)
  $0 stop
  exit 0
  ;;
esac

exit 0
