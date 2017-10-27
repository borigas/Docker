#!/bin/bash

echo "****************************************"
echo "****************************************"
echo "    Updating Certificates $(date)"
echo "****************************************"
echo "****************************************"

# Remove available sites that may not be available anymore
for configLink in /etc/nginx/sites-enabled/*; do
    matchingFile="/etc/nginx/sites-available/$(basename $configLink)"
    if [ ! -e $matchingFile ]; then
        rm $configLink
    fi
done

# Loop over site config files
for siteConfig in /etc/nginx/sites-available/*; do
    echo "-------------------------------------"
    echo "Getting subdomains from ${siteConfig}"

    # Pull the site names from the server_name directive
    SUBDOMAINS_ARGS=$(grep -rw $siteConfig -e "server_name" | sed 's/\<server_name\>//g' | tr -d ';' | sed -r 's/[ ]+/ -d /g')
    echo "SUBDOMAINS_ARGS: $SUBDOMAINS_ARGS"
    
    if [ -n "$SUBDOMAINS_ARGS" ]; then
        echo "Generate ${siteConfig} certificate"
        certbot certonly  --text --non-interactive --rsa-key-size $RSA_KEY_SIZE \
                        --email $LETSENCRYPT_EMAIL --agree-tos --expand \
                        --webroot --webroot-path=/var/www/letsencrypt \
                        --reinstall $SUBDOMAINS_ARGS \
                        --renew-hook "/etc/init.d/nginx restart"
        echo "Done generating certificate"
    fi
    
    enabledConfig="/etc/nginx/sites-enabled/$(basename $siteConfig)"
    if [ -e "$enabledConfig" ]; then
        echo "$enabledConfig already exists. Not creating symlink"
    else
        echo "Linking $enabledConfig to $siteConfig"
        ln -s $siteConfig $enabledConfig
        echo "Linked $enabledConfig to $siteConfig"
    fi
    echo "========================================"
done

echo "-----   Done Updating Certificates   -----"
