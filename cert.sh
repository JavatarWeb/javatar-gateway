#!/bin/bash

domain="javatar.ru"
alldomains="javatar.ru,mail.javatar.ru"

sudo apt update
sudo apt install python3 python3-venv libaugeas0
sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
sudo /opt/certbot/bin/pip install certbot
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot

sudo certbot certonly --standalone -d ${alldomains}

sudo mkdir certs/${domain}
sudo cp /etc/letsencrypt/live/${domain}/{cert.pem,chain.pem,fullchain.pem,privkey.pem} certs/${domain}
sudo chown -R ${USER}:users certs
