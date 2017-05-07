Build with
`docker build -t borigas/letsencrypt-reverse-proxy`

Run with
`docker run -d -p 80:80 -p 443:443 --name nginx -v /home/ben/Certs:/etc/letsencrypt -v /mnt/DockerData/Nginx/Sites:/etc/nginx/sites-available -e LETSENCRYPT_EMAIL="borigas@gmail.com" borigas/letsencrypt-reverse-proxy `
