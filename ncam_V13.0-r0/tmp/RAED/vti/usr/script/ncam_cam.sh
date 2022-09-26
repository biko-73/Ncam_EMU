#!/bin/sh
########################################
######     Powered by RAED        ######
########################################

CAMNAME="ncam 13.0"


remove_tmp () {
  rm -rf /tmp/cainfo.* /tmp/camd.* /tmp/sc.* /tmp/*.info* /tmp/*.tmp*
        [ -e /tmp/.emu.info ] && rm -rf /tmp/.emu.info
        [ -e /tmp/ncam.mem ] && rm -rf /tmp/ncam.mem
        [ -e /tmp/oscam.mem ] && rm -rf /tmp/oscam.mem
}

case "$1" in
  start)
  echo "[SCRIPT] $1: $CAMNAME"
  remove_tmp
  touch /tmp/.emu.info
  echo $CAMNAME > /tmp/.emu.info
  /usr/bin/ncam &
  ;;
  stop)
  echo "[SCRIPT] $1: $CAMNAME"
  kill `pidof ncam`
  remove_tmp
  ;;
  restart)
  $0 stop
  sleep 2
  $0 start
  exit
  ;;
  *)
  $0 stop
  exit 0
  ;;
esac

exit 0
