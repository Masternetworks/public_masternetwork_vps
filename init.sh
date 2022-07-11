#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "* * * * * python3 /var/mydir/downloadfrpc.py "$1 >> mycron
#install new cron file
crontab mycron
rm mycron
python3 /var/mydir/downloadfrpc.py
