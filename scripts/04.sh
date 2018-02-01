#!/bin/bash

tmpmd5=/tmp/md5list
dir=/etc/crontab
newmd5=$(md5sum "$dir")
if grep -q "$newmd5" $tmpmd5 ; then
	true
else
	echo "/etc/crontab was modified" | mail -s "INTRUDER ALERT" root
fi
script04="/home/baudiber/SCRIPT/04.sh"
cronjob04="0 0 * * * $script04"
(crontab -l | grep -v -F "$script04" ; echo "$cronjob04") | crontab -
