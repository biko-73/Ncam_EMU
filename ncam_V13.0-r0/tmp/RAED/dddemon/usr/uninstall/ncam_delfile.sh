#!/bin/sh
########################################
######      Edited by RAED        ######
########################################
# Type: Cam

killall -9 ncam 2>/dev/null
sleep 2
remove_tmp

rm -rf /usr/bin/ncam
rm -rf /usr/script/ncam_cam.sh
rm -rf /usr/uninstall/ncam_delfile.sh

exit 0

