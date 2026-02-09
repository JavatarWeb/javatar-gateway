#!/bin/bash
source .env

sudo apt update
sudo apt install python3 python3-venv libaugeas0
sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
sudo /opt/certbot/bin/pip install certbot
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot

sudo certbot certonly --standalone -d ${DOMAINS}

sudo mkdir certs/${MAINDOMAIN}
sudo cp /etc/letsencrypt/live/${MAINDOMAIN}/{cert.pem,chain.pem,fullchain.pem,privkey.pem} certs/${MAINDOMAIN}
sudo chown -R ${USER}:users certs
