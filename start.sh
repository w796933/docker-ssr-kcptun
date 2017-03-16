#!/bin/bash
python  /shadowsocksr/shadowsocks/server.py -p 80 -k ij0LevE6XvuiKeTyGIET -m chacha20 -o tls1.2_ticket_auth_compatible -O auth_sha1_v4_compatible -d start
sleep 5
./server_linux_amd64 -t "127.0.0.1:80" -l ":4000" -mode fast2