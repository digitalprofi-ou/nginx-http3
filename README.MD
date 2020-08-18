# Nginx Quic (HTTP/3) Docker setup for tests 

## IMPORTANT!!!
Does not work with self signed certificates, at least in chrome even if enabled for localhost and added to trusted!!

## Run from docker file 
This command will run locally nginx to listen on ports
`docker build -t <image_tag> . && docker run -p 80:80 -p 443:443 -p 443:443/udp -v /www:/var/www/html -v /sites-available:/usr/local/nginx/conf.d -v /certs:/certs <image_tag> `

## Run from repository   
