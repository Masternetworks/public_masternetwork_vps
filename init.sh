cat > /etc/systemd/system/FRPC.service <<EOF
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
sudo systemctl start FRPC
sudo systemctl enable FRPC
