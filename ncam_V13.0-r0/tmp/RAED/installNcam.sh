#!/bin/sh
###################################
#Created By RAED 22-02-2021 Boxes #
###################################
#### Tmp work director
VER='13.0'
TMPDIR='/tmp/RAED'
BINPATH='/tmp/RAED/ncam'
ARMBIN='/tmp/RAED/ARM/ncam'
ARMBINopenssl='/tmp/RAED/ARM/ncam-Openssl11'
MIPSBIN='/tmp/RAED/MIPS/ncam'
MIPSBINopenssl='/tmp/RAED/MIPS/ncam-Openssl11'
SH4BIN='/tmp/RAED/SH4/ncam'
SH4BINopenssl='/tmp/RAED/SH4/ncam-Openssl11'
AARCH64BIN='/tmp/RAED/AARCH64/ncam'
AARCH64BINopenssl='/tmp/RAED/AARCH64/ncam-Openssl11'
CONFIGPATHTMP='/tmp/RAED/etc'
CONFIGPATHTMP_SH4='/tmp/RAED/etc_sh4'
#CONFIGPATHTMP_OE25='/tmp/RAED/etc_OE2.5'
#### Path of opkg files
STATUS='/var/lib/opkg/status'
INFO='/var/lib/opkg/info'
#### checking your device path
CHECK='/tmp/check'
# Path of Config Files
CONFIGPATH='/etc/tuxbox/config'
# Path of Config File in Boxes Avilable
CONFIGccache='/etc/tuxbox/config/ncam.ccache'
CONFIGconf='/etc/tuxbox/config/ncam.conf'
CONFIGdvbapi='/etc/tuxbox/config/ncam.dvbapi'
CONFIGprovid='/etc/tuxbox/config/ncam.provid'
CONFIGserver='/etc/tuxbox/config/ncam.server'
CONFIGservices='/etc/tuxbox/config/ncam.services'
CONFIGsrvid2='/etc/tuxbox/config/ncam.srvid2'
CONFIGuser='/etc/tuxbox/config/ncam.user'
AUTOROLL='/etc/tuxbox/config/AutoRoll.Key'
SOFTCAM='/etc/tuxbox/config/SoftCam.Key'
CONSTANT='/etc/tuxbox/config/constant.cw'
CCCAMCFG='/etc/tuxbox/config/CCcam.cfg'
NCAMFS='/etc/tuxbox/config/ncam.fs'
# Path of Config File in Tmp Folder
CONFIGccachetmp='/tmp/RAED/etc/tuxbox/config/ncam.ccache'
CONFIGconftmp='/tmp/RAED/etc/tuxbox/config/ncam.conf'
CONFIGdvbapitmp='/tmp/RAED/etc/tuxbox/config/ncam.dvbapi'
CONFIGprovidtmp='/tmp/RAED/etc/tuxbox/config/ncam.provid'
CONFIGservertmp='/tmp/RAED/etc/tuxbox/config/ncam.server'
CONFIGservicestmp='/tmp/RAED/etc/tuxbox/config/ncam.services'
CONFIGsrvid2tmp='/tmp/RAED/etc/tuxbox/config/ncam.srvid2'
CONFIGusertmp='/tmp/RAED/etc/tuxbox/config/ncam.user'
AUTOROLLtmp='/tmp/RAED/etc/tuxbox/config/AutoRoll.Key'
SOFTCAMtmp='/tmp/RAED/etc/tuxbox/config/SoftCam.Key'
CONSTANTtmp='/tmp/RAED/etc/tuxbox/config/constant.cw'
CONFIGCCCamCFGtmp='/tmp/RAED/etc/tuxbox/config/CCcam.cfg'
NCAMFStmp='/tmp/RAED/etc/tuxbox/config/ncam.fs'
### find image name type
GP3='/usr/lib/enigma2/python/Plugins/Bp/geminimain'
BLACKHOLE='/usr/lib/enigma2/python/Blackhole'
OPENBH1='/usr/lib/enigma2/python/Screens/BpBlue.pyo'
OPENBH2='/usr/lib/enigma2/python/Screens/BpBlue.py'
OPENBH3='/usr/lib/enigma2/python/Screens/BpBlue.pyc'
MEDIASAT='/usr/lib/enigma2/python/MediaSat'
TSIMAGE='/usr/lib/enigma2/python/Plugins/TSimage'
VTI='/usr/lib/enigma2/python/Plugins/SystemPlugins/VTIPanel'
MERLIN3='/usr/lib/enigma2/python/Plugins/Extensions/AddOnManager'
DREAMELITE='/usr/lib/enigma2/python/DE'
Demoni='/usr/lib/enigma2/python/Plugins/SystemPlugins/DemonisatManager'
OPENDROID='/usr/lib/enigma2/python/OPENDROID'
EGAMI='/usr/lib/enigma2/python/EGAMI'
Satdreamgr='/usr/lib/enigma2/python/Plugins/Satdreamgr'
Powerboard='/usr/lib/enigma2/python/Plugins/Extensions/PowerboardCenter'
PKT='/usr/lib/enigma2/python/Plugins/Extensions/PKT'
OPENVIX='/usr/lib/enigma2/python/Plugins/SystemPlugins/ViX'
Domica='/usr/lib/enigma2/python/Plugins/Domica'
HDMU='/usr/lib/enigma2/python/Plugins/Extensions/HDMUCenter'
OPENLD='/usr/lib/enigma2/python/Plugins/Extensions/LDteam'
LT='/usr/lib/enigma2/python/LT'
TDW='/usr/lib/enigma2/python/Plugins/Extensions/TDW'
OPENHDF='/usr/lib/enigma2/python/Plugins/Extensions/HDF-Toolbox'
OPENESI='/usr/lib/enigma2/python/Plugins/Extensions/ExtraAddonss'
NonSoloSat='/usr/lib/enigma2/python/Plugins/Extensions/NssPanel'
NEWNIGMA2='/usr/lib/enigma2/python/Plugins/newnigma2'
SATLODGE='/usr/lib/enigma2/python/Plugins/SatLodge'
DreamOSat='/usr/lib/enigma2/python/Plugins/Extensions/DreamOSatcamManager'
OpenSourceImage='/usr/lib/enigma2/python/Tools/StbHardware.pyo'
########### check version off openssl to support correct bin file #####
if [ -f /etc/apt/apt.conf ] ; then
    images="OE2.5 IMAGES:"
    lib_files="/var/lib/dpkg/status"
    list_files="/var/lib/dpkg/info"
elif [ -f /etc/opkg/opkg.conf ] ; then
    images="OE2.0 IMAGES:"
    lib_files="/var/lib/opkg/status"
    list_files="/var/lib/opkg/info"
else
    echo "Sorry, your device not have the opkg/dpkg folder :("
fi
#if grep -qs 'Package: libssl1.1' cat $lib_files ; then
#    echo "$images openssl 1.1.1"
#    rm -f $ARMBIN
#    rm -f $SH4BIN
#    rm -f $MIPSBIN
#    rm -f $AARCH64BIN
#    mv $ARMBINopenssl $ARMBIN
#    mv $SH4BINopenssl $SH4BIN
#    mv $MIPSBINopenssl $MIPSBIN
#    mv $AARCH64BINopenssl $AARCH64BIN
#fi
#### checking your device and bin file #####
uname -m > $CHECK
sleep 1;
if grep -qs -i 'armv7l' cat $CHECK ; then
   echo ':Your Device IS ARM processor ...'
   if [ ! -f $ARMBIN ] ; then
         echo "**************************"
         echo "**** Bin file Missing ****"
         echo "**************************"
         rm -r $TMPDIR > /dev/null 2>&1
         rm -r $CHECK > /dev/null 2>&1
         exit 1
   else
         cp -f $ARMBIN $TMPDIR
         #rm -r $CONFIGPATHTMP
         #mv $CONFIGPATHTMP_OE25 $CONFIGPATHTMP
   fi
elif grep -qs -i 'aarch64' cat $CHECK ; then
   echo ':Your Device IS AARCH64 processor ...'
   if [ ! -f $AARCH64BIN ] ; then
         echo "**************************"
         echo "**** Bin file Missing ****"
         echo "**************************"
         rm -r $TMPDIR > /dev/null 2>&1
         rm -r $CHECK > /dev/null 2>&1
         exit 1
   else
         cp -f $AARCH64BIN $TMPDIR
         #rm -r $CONFIGPATHTMP
         #mv $CONFIGPATHTMP_OE25 $CONFIGPATHTMP
   fi
elif grep -qs -i 'mips' cat $CHECK ; then
   echo ':Your Device IS MIPS processor ...'
   if [ ! -f $MIPSBIN ] ; then
         echo "**************************"
         echo "**** Bin file Missing ****"
         echo "**************************"
         rm -r $TMPDIR > /dev/null 2>&1
         rm -r $CHECK > /dev/null 2>&1
         exit 1
   else
         cp -f $MIPSBIN $TMPDIR
   fi
elif grep -qs -i 'sh4' cat $CHECK ; then
   echo ':Your Device IS SH4 processor ...'
   if [ ! -f $SH4BIN ] ; then
         echo "**************************"
         echo "**** Bin file Missing ****"
         echo "**************************"
         rm -r $TMPDIR > /dev/null 2>&1
         rm -r $CHECK > /dev/null 2>&1
         exit 1
   else
         cp -f $SH4BIN $TMPDIR
         rm -r $CONFIGPATHTMP
         mv $CONFIGPATHTMP_SH4 $CONFIGPATHTMP
   fi
else
   echo 'Sorry, your Device does not have the proper Emu'
   rm -r $TMPDIR > /dev/null 2>&1
   rm -r $CHECK > /dev/null 2>&1
   exit 1
fi
#########
if [ -r $GP3 ]; then
   echo "GP3 image"
   cp -rf $TMPDIR/GP3/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
else
if [ -r $DreamOSat ]; then
   echo "DreamOSat camManager"
   cp -rf $TMPDIR/DreamOSat/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif grep -qs -i "OoZooN" /etc/image-version; then
   echo "OoZooN image"
   if [ ! -r /usr/camd ]; then
        mkdir -p /usr/camd > /dev/null 2>&1
   fi
   cp -rf $TMPDIR/oozoon/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/camd > /dev/null 2>&1
elif grep -qs -i "ItalySat" /etc/image-version; then
   echo "ItalySat image"
   if [ ! -d /var/bin ]; then
      ln -sfn /usr/bin /var/bin
   fi
   if [ ! -d /var/emuscript ]; then
      ln -sfn /usr/emuscript /var/emuscript
   fi
   cp -rf $TMPDIR/italysat/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif grep -qs -i "opentr" /etc/issue.net; then
   echo "OpenTR image"
   cp -rf $TMPDIR/opentr/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif grep -qs -i "OpenSPA" /etc/image-version; then
   echo "OpenSPA image"
   cp -rf $TMPDIR/openspa/* / > /dev/null 2>&1
   cp -rf $BINPATH /var/bin > /dev/null 2>&1
elif grep -qs -i "titannit" /etc/image-version; then
   echo " OpenAFF-Titan image"
   cp -rf $TMPDIR/AFF/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin/ > /dev/null 2>&1
elif grep -qs -i "openATV" /etc/image-version; then
   echo "openATV image"
   cp -f $TMPDIR/openatv/etc/init.d/softcam.ncam /etc/init.d/softcam.ncam-$VER > /dev/null 2>&1
   cp -f $BINPATH /usr/bin/ncam-$VER > /dev/null 2>&1
elif grep -qs -i "PURE2" /etc/image-version; then
   echo "PURE2 image"
   if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam > /dev/null 2>&1
   fi
   cp -rf $TMPDIR/pbnigma/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin/cam > /dev/null 2>&1
elif grep -qs -i "rudream" /etc/image-version; then
   echo "ruDREAM image"
   cp -rf $TMPDIR/rudream/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif grep -qs -i "Peter" /etc/issue.net; then
   echo "PeterPan image"
   cp -rf $TMPDIR/PeterPan/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif grep -qs -i "OpenEight" /etc/image-version; then
   echo "OpenEight image"
   cp -rf $TMPDIR/openeight/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif grep -qs -i "openMips" /etc/image-version; then
   echo "OpenMips image"
   if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam > /dev/null 2>&1
   fi
   cp -rf $TMPDIR/openmips/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin/cam > /dev/null 2>&1
elif grep -qs -i "OpenPlus" /etc/image-version; then
   echo "OpenPlus image"
   cp -rf $TMPDIR/OpenPlus/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif grep -qs -i "OpenBox" /etc/issue; then
   echo "OpenBox image"
   cp -rf $TMPDIR/openpli/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif grep -qs -i "cobralibero" /etc/issue.net; then
   echo "COBRALIBERO image"
   cp -rf $TMPDIR/openpli/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif grep -qs -i "areadeltasat" /etc/issue.net; then
   echo "AREADELTASAT image"
   cp -rf $TMPDIR/openpli/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif grep -qs -i "teamBlue" /etc/image-version; then
   echo "teamBlue image"
   cp -rf $TMPDIR/teamBlue/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $BLACKHOLE ]; then
   echo "Blackhole image"
   cp -rf $TMPDIR/BH/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -f $OPENBH1 -o -f $OPENBH2 -o -f $OPENBH3 ]; then
   echo "OpenBlackhole image"
   cp -rf $TMPDIR/BH/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $MEDIASAT ]; then
   echo "MediaSat image"
   cp -rf $TMPDIR/BH/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $TSIMAGE ]; then
   echo "OpenTS/Ts image"
   if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam > /dev/null 2>&1
   fi
   cp -rf $TMPDIR/ts/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin/cam > /dev/null 2>&1
elif [ -r $VTI ]; then
   echo "VTI image"
   cp -rf $TMPDIR/vti/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $NEWNIGMA2 ]; then
   echo "newnigma2 image"
   cp -rf $TMPDIR/newnigma2/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $MERLIN3 ]; then
   echo "Merlin3 image"
   if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam > /dev/null 2>&1
   fi
   cp -rf $TMPDIR/Merlin3/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin/cam > /dev/null 2>&1
elif [ -r $DREAMELITE ]; then
   echo "Dream-Elite image"
   if [ ! -d /var/bin ]; then
      ln -sfn /usr/bin /var/bin
   fi
   cp -rf $TMPDIR/dreamelite/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $Demoni ]; then
   echo "DDD-Demoni image"
   cp -rf $TMPDIR/dddemon/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $OPENDROID ]; then
   echo "OpenDroid image"
   cp -rf $TMPDIR/opendroid/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $EGAMI ]; then
   echo "Egami image"
   if [ ! -d /var/bin ]; then
      ln -sfn /usr/bin /var/bin
   fi
   cp -rf $TMPDIR/egami/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $Satdreamgr ]; then
   echo "SatdreamGr image"
   cp -rf $TMPDIR/satdreamgr/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $Powerboard ]; then
   echo "PBnigma-VIX image"
   if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam > /dev/null 2>&1
   fi
   cp -rf $TMPDIR/pbnigma/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin/cam > /dev/null 2>&1
elif [ -r $PKT ]; then
   echo "PKT image"
   if [ ! -d /var/bin ]; then
      ln -sfn /usr/bin /var/bin > /dev/null 2>&1
   fi
   if [ -d /var/keys ]; then
      mkdir -p /usr/keys > /dev/null 2>&1
      cp -rf /var/keys/* /usr/keys > /dev/null 2>&1
      rm -r /var/keys > /dev/null 2>&1
   fi
   ln -sfn /usr/keys /var/keys > /dev/null 2>&1
   if [ -d $CONFIGPATH ]; then
      cp -rf $CONFIGPATH/* /usr/keys > /dev/null 2>&1
      rm -r $CONFIGPATH > /dev/null 2>&1
      ln -sfn /usr/keys $CONFIGPATH > /dev/null 2>&1
   else
      ln -sfn /usr/keys $CONFIGPATH > /dev/null 2>&1
   fi
   cp -rf $BINPATH /var/emu > /dev/null 2>&1
elif grep -qs -i "OpenNFR" /etc/image-version; then
   echo "OpenNFR image"
   if [ ! -r /usr/emu ]; then
        mkdir -p /usr/emu > /dev/null 2>&1
   fi
   cp -rf $BINPATH /usr/emu > /dev/null 2>&1
elif [ -r $OPENVIX ]; then
   echo "OpenVIX image"
   if [ ! -r /usr/softcams ]; then
        mkdir -p /usr/softcams > /dev/null 2>&1
   fi
   #cp -rf $TMPDIR/openvix/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/softcams > /dev/null 2>&1
elif [ -r $Domica ]; then
   echo "Domica image"
   cp -rf $TMPDIR/domica/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $HDMU ]; then
   echo "HDMU image"
   if [ ! -r /usr/emu ]; then
        mkdir -p /usr/emu > /dev/null 2>&1
   fi
   cp -rf $TMPDIR/HDMU/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/emu > /dev/null 2>&1
elif [ -r $OPENLD ]; then
   echo "OpenLD image"
   cp -rf $TMPDIR/openld/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $LT ]; then
   echo "LT image"
   cp -rf $TMPDIR/LT/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $TDW ]; then
   echo "TDW image"
   if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam > /dev/null 2>&1
   fi
   cp -rf $TMPDIR/TDW/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin/cam > /dev/null 2>&1
elif [ -r $OPENHDF ]; then
   echo "OpenHDF image"
   cp -rf $TMPDIR/HDF/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $OPENESI ]; then
   echo "OpenESI image"
   cp -rf $TMPDIR/OpenESI/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $NonSoloSat ]; then
   echo "NonSoloSat image"
   if [ ! -r /usr/bin/cam ]; then
        mkdir -p /usr/bin/cam > /dev/null 2>&1
   fi
   cp -rf $TMPDIR/NssPanel/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin/cam > /dev/null 2>&1
elif grep -qs -i "openpli" /etc/issue; then
   echo "OpenPLI image"
   cp -rf $TMPDIR/openpli/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif grep -qs -i "openvision" /etc/issue; then
   echo "OpenVision image"
   cp -rf $TMPDIR/openpli/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin > /dev/null 2>&1
elif [ -r $SATLODGE ]; then
   echo " Satlodge image"
   cp -rf $TMPDIR/satlodge/* / > /dev/null 2>&1
   cp -rf $BINPATH /usr/bin/ > /dev/null 2>&1
else
echo "***************************************************"
echo "*                                                 *"
echo "* No emu script to this image now .. ask about it *"
echo "*                                                 *"
echo "***************************************************"
exit 1
fi
fi
######### checking config files #########
if [ ! -d $CONFIGPATH ]; then
   mkdir -p $CONFIGPATH > /dev/null 2>&1
fi
if [ -f $CONFIGccache -a -f $CONFIGconf -a -f $CONFIGdvbapi -a -f $CONFIGprovid -a -f $CONFIGserver -a -f $CONFIGservices -a -f $CONFIGsrvid2 -a -f $CONFIGuser -a -f $AUTOROLL -a -f $SOFTCAM -a -f $CONSTANT -a -f $CCCAMCFG -a -f $NCAMFS ]; then
   echo "[ All Config Files found ]"
else
   echo "[ Some Config Files Missing .. will send it ]"
   echo "---------------------------------------------"
   if [ ! -f $CONFIGccache ]; then
      cp -f $CONFIGccachetmp $CONFIGPATH > /dev/null 2>&1
      echo "[ send (ncam.ccache) file]"
   fi
   if [ ! -f $CONFIGconf ]; then
      cp -f $CONFIGconftmp $CONFIGPATH > /dev/null 2>&1
      echo "[ send (ncam.conf) file]"
   fi
   if [ ! -f $CONFIGdvbapi ]; then
      cp -f $CONFIGdvbapitmp $CONFIGPATH > /dev/null 2>&1
      echo "[ send (ncam.dvbapi) file]"
   fi
   if [ ! -f $CONFIGprovid ]; then
      cp -f $CONFIGprovidtmp $CONFIGPATH > /dev/null 2>&1
      echo "[ send (ncam.provid) file]"
   fi
   if [ ! -f $CONFIGserver ]; then
      cp -f $CONFIGservertmp $CONFIGPATH > /dev/null 2>&1
      echo "[ send (ncam.server) file]"
   fi
   if [ ! -f $CONFIGservices ]; then
      cp -f $CONFIGservicestmp $CONFIGPATH > /dev/null 2>&1
      echo "[ send (ncam.services) file]"
   fi
   if [ ! -f $CONFIGsrvid2 ]; then
      cp -f $CONFIGsrvid2tmp $CONFIGPATH > /dev/null 2>&1
      echo "[ send (ncam.srvid2) file]"
   fi
   if [ ! -f $CONFIGuser ]; then
      cp -f $CONFIGusertmp $CONFIGPATH > /dev/null 2>&1
      echo "[ send (ncam.user) file]"
   fi
   if [ ! -f $AUTOROLL ]; then
      cp -f $AUTOROLLtmp $AUTOROLL > /dev/null 2>&1
      echo "[ send (AutoRoll.Key) file]"
   fi
   if [ ! -f $SOFTCAM ]; then
      cp -f $SOFTCAMtmp $SOFTCAM > /dev/null 2>&1
      echo "[ send (SoftCam.Key) file]"
   fi
   if [ ! -f $CONSTANT ]; then
      cp -f $CONSTANTtmp $CONSTANT > /dev/null 2>&1
      echo "[ send (constant.cw) file]"
   fi
   if [ ! -f $CCCAMCFG ]; then
      cp -f $CONFIGCCCamCFGtmp $CCCAMCFG > /dev/null 2>&1
      echo "[ send (CCcam.cfg) file]"
   fi
   if [ ! -f $NCAMFS ]; then
      cp -f $NCAMFStmp $NCAMFS > /dev/null 2>&1
      echo "[ send (ncam.fs) file]"
   fi
   echo "---------------------------------------------"
fi
   rm -f $CONFIGdvbapi > /dev/null 2>&1
   rm -f $CONFIGprovid > /dev/null 2>&1
   rm -f $CONFIGservices > /dev/null 2>&1
   rm -f $CONFIGsrvid2 > /dev/null 2>&1
   rm -f $NCAMFS > /dev/null 2>&1
   cp -f $CONFIGdvbapitmp $CONFIGPATH > /dev/null 2>&1
   cp -f $CONFIGprovidtmp $CONFIGPATH > /dev/null 2>&1
   cp -f $CONFIGservicestmp $CONFIGPATH > /dev/null 2>&1
   cp -f $CONFIGsrvid2tmp $CONFIGPATH > /dev/null 2>&1
   cp -f $NCAMFStmp $NCAMFS > /dev/null 2>&1
######### checking OpenPLI softcam symlink #########
if [ -f /etc/init.d/softcam.None ]; then
   if type update-rc.d >/dev/null 2>/dev/null; then
	   if [ -n "$D" ]; then
		   OPT="-r $D"
	   else
		   OPT="-s"
	   fi
	   update-rc.d $OPT softcam defaults 50 > /dev/null 2>&1
   fi
fi

exit 0
