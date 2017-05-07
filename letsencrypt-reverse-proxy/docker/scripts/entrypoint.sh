#!/bin/bash

# Check requirements
if [ "$LETSENCRYPT_EMAIL" == "none" ]; then echo "Please fill environment variable LETSENCRYPT_EMAIL"; exit; fi

# Wait for set period
echo "### Waiting for ${STARTUP_WAIT} seconds... "
sleep ${STARTUP_WAIT}
echo "Done Waiting"

dhFile="/etc/letsencrypt/dhparam.pem"
if [ ! -e $dhFile ]; then
    echo "Creating diffie hellman key"
    echo "This can take a long time..."
    openssl dhparam -out $dhFile 4096
    echo "Diffie hellman key created"
fi

# Launch reverse-proxy
nginx

bash /docker/scripts/InstallCerts.sh

nginx -s reload

echo "Starting cron"
cron

# Nginx log
tail -f /var/log/nginx/error.log
