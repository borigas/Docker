#!/bin/bash

echo "Starting..."

while [ : ]; do
    domainOptions=$(echo "$DOMAIN_ARGS" | tr ';' '\n')
    
    for currentOptions in $domainOptions; do
        echo "****   Domain options: $currentOptions   ****"
    
        host="$(echo $currentOptions | cut -d ',' -f1)"
        domain="$(echo $currentOptions | cut -d ',' -f2)"
        password="$(echo $currentOptions | cut -d ',' -f3)"
        echo "Host: $host"
        echo "Domain: $domain"
        echo "Password: $password"
        
        url="https://dynamicdns.park-your-domain.com/update?host=$host&domain=$domain&password=$password&ip="
        
        echo "Url: $url"
        curl "$url"
    done
    
    echo "Done. Sleeping..."
    echo "============================================="
    
    sleep $INTERVAL
done

echo "Exiting"