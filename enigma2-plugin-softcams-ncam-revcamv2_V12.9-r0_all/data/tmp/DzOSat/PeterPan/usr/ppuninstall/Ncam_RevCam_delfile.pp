#!/bin/sh
#### "*******************************************"
#### "              Created By RAED              *"
#### "*        << Edited by  MOHAMED_OS >>       *"
#### "*        ..:: www.tunisia-sat.com ::..     *"
#### "*******************************************"

/usr/ppteam/Ncam_RevCam_cam.pp stop
killall -9 ncam 2>/dev/null

rm -rf /usr/bin/ncam
rm -rf /usr/ppteam/Ncam_RevCam_cam.pp
rm -rf /usr/ppuninstall/Ncam_RevCam_delfile.pp

exit 0
