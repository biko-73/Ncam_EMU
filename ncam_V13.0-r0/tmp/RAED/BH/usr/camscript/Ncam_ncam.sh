#!/bin/sh

CAMNAME="Ncam 13.0"

remove_tmp () {
  rm -rf /tmp/*.info* /tmp/*.tmp* /tmp/.ncam /tmp/*share* /tmp/*.pid* /tmp/*sbox* /tmp/ncam.* /tmp/*.ncam
}

case "$1" in
  start)
  echo "[SCRIPT] $1: $CAMNAME"
  remove_tmp
  touch /tmp/.emu.info
  echo ncam > /tmp/.emu.info
  /usr/bin/ncam &
  ;;
  stop)
  echo "[SCRIPT] $1: $CAMNAME"
  killall -9 ncam  2>/dev/null
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
