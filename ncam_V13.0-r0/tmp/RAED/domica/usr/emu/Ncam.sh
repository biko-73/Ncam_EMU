#!/bin/sh

# DOMICA image
remove_tmp () {
  rm -rf /tmp/*.tmp* /tmp/*.info*
}

case "$1" in
  start)
  remove_tmp
  /usr/bin/ncam &
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
