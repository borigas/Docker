Build with
`docker build -t borigas/letsencrypt-reverse-proxy`

Run with
`docker run -d -p 80:80 -p 443:443 --name nginx --restart=always -v /home/ben/Certs:/etc/letsencrypt -v /media/DockerData/Nginx/Sites:/etc/nginx/sites-available -e LETSENCRYPT_EMAIL="borigas@gmail.com" borigas/letsencrypt-reverse-proxy`
