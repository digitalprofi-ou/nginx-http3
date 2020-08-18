# Nginx Quic (HTTP/3) Docker setup for tests 

## Run from docker file 
This command will run locally nginx to listen on 80 port with mapped folders from repo
`docker build -t <image_tag> . && docker run -p 80:80 -p 443:443 -v www:/var/www/html -v sites-available:/usr/local/nginx/conf.d -v certs:/certs <image_tag> `

## Run from repository   
