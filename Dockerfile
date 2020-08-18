FROM ubuntu:18.04

#Dependencies
RUN apt-get update \
    && apt-get install -y wget cmake pkg-config golang libunwind-dev linux-kernel-headers build-essential checkinstall zlib1g-dev

## PCRE for nginx
RUN wget https://ftp.pcre.org/pub/pcre/pcre-8.44.tar.gz \
    && tar -zxf pcre-8.44.tar.gz \
    && cd pcre-8.44 \
    && ./configure \
    && make \
    && make install

# ZLIB for nginx
RUN wget http://zlib.net/zlib-1.2.11.tar.gz \
    && tar -zxf zlib-1.2.11.tar.gz \
    && cd zlib-1.2.11 \
    && ./configure \
    && make \
    && make install

##
#RUN wget http://www.openssl.org/source/openssl-1.1.1g.tar.gz \
#    && tar -zxf openssl-1.1.1g.tar.gz \
#    && cd openssl-1.1.1g \
#    && ./configcd  \
#    && make \
#    && sudo make install

#Boring ssl for nginx (instead of openssl to support quic)
RUN apt-get install -y git \
    && git clone https://github.com/google/boringssl.git \
    && cd boringssl \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make

# Install Nginx
RUN wget https://hg.nginx.org/nginx-quic/archive/quic.tar.gz \
    && tar -xvf quic.tar.gz \
    && cd nginx-quic-quic \
    && ./auto/configure --with-debug --with-http_v3_module  --with-cc-opt="-I../boringssl/include" --with-ld-opt="-L../boringssl/build/ssl -L../boringssl/build/crypto" --with-http_v3_module \
    && make \
    && make install

COPY ./files/nginx.conf /usr/local/nginx/conf/nginx.conf

WORKDIR /var/www/html

CMD /usr/local/nginx/sbin/nginx
