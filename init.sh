#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "* * * * * python3 /var/mydir/downloadfrpc.py "$1 >> mycron
#install new cron file
crontab mycron
rm mycron
python3 /var/mydir/downloadfrpc.py $1
cat > /etc/systemd/system/test.service <<EOF

[Unit]
Description=FRPC
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
ExecStart=/usr/bin/python3 /var/mydir/downloadfrpc.py $1
WorkingDirectory=/var/mydir/
Restart=always
RestartSec=5
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=%n
[Install]
WantedBy=multi-user.target

EOF 
