#!/bin/bash
python  /shadowsocksr/shadowsocks/server.py -p 80 -k passwd -m chacha20 -o tls1.2_ticket_auth_compatible -O auth_sha1_v4_compatible -d start