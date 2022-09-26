#!/bin/sh
########################################
######      Edited by RAED        ######
########################################

/usr/ppteam/ncam_cam.pp stop
killall -9 ncam 2>/dev/null


rm -rf /usr/bin/ncam
rm -rf /usr/ppteam/ncam_cam.pp
rm -rf /usr/ppuninstall/ncam_delfile.pp

exit 0
