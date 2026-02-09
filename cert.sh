#!/bin/bash
source .env

sudo apt update
sudo apt install python3 python3-venv libaugeas0
sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
sudo /opt/certbot/bin/pip install certbot
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot

sudo certbot certonly --standalone -d ${DOMAINS}

sudo rm -rf certs/${MAIN_DOMAIN}
sudo mkdir certs/${MAIN_DOMAIN}
sudo cp /etc/letsencrypt/live/${MAIN_DOMAIN}/{cert.pem,chain.pem,fullchain.pem,privkey.pem} certs/${MAIN_DOMAIN}
sudo chown -R ${USER}:users certs
