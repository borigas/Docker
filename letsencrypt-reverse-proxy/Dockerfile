FROM debian:buster

# Install certbot, nginx, and cron
RUN apt-get update
RUN apt-get install -y nginx dnsmasq cron certbot

# Copy files
COPY docker /docker

# Copy configuration files
RUN cp /docker/config/nginx.conf /etc/nginx/ && \
    cp /docker/config/proxy.conf /etc/nginx/conf.d/ && \
    cp /docker/config/ssl.conf /etc/nginx/conf.d/ && \
    cp /docker/config/ssl_redirect.conf /etc/nginx/conf.d/
    
RUN mkdir -p /var/www/letsencrypt

RUN touch /var/log/cron.log
RUN crontab -l | { cat; echo "0 * * * * bash /docker/scripts/InstallCerts.sh >> /var/log/cron.log"; } | crontab -

# Volumes
VOLUME /etc/nginx/sites-available
VOLUME /etc/letsencrypt

# Environment variables
ENV LETSENCRYPT_EMAIL none
ENV RSA_KEY_SIZE 4096
ENV STARTUP_WAIT 0

# Ports
EXPOSE 80
EXPOSE 443

# Command
CMD ["bash", "/docker/scripts/entrypoint.sh" ]
