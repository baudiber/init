apt-get update && apt-get --yes --force-yes full-upgrade
script02="/home/baudiber/SCRIPT/02.sh >> /var/log/update_script.log 2>&1"
cronjob02="0 4 * * 1 $script02"
(crontab -l | grep -v -F "$script02" ; echo "$cronjob02") | crontab -
