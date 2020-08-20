# Nginx Quic (HTTP/3) Docker setup for tests 

## IMPORTANT!!!
Does not work with self signed certificates, at least in chrome even if enabled for localhost and added to trusted!!

## Run from docker file 
This command will run locally nginx to listen on ports

- Update Dockerfile if you need additional modules for nginx
- Update path to files in run command
- Update nginx settings in files/nginx.conf before build, this file copied into image
- Update site setting in sites-available/default.conf this folder mounted with run command
- Update certs for you page in certs, this folder mounted in container with run command

`docker build -t <image_tag> . && docker run -p 80:80 -p 443:443 -p 443:443/udp -v /www:/var/www/html -v /sites-available:/usr/local/nginx/conf.d -v /certs:/certs <image_tag> `

## Run from repository   
