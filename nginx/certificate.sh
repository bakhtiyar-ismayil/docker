#!/bin/bash

openssl genrsa -out rootCA.key 4096

sleep 2

openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 3650 -out rootCA.crt

sleep 2

openssl genrsa -out intermediateCA.key 4096

sleep 2

openssl req -new -key intermediateCA.key -out intermediateCA.csr

sleep 2

openssl req -new -key intermediateCA.key -out intermediateCA.csr

sleep 2

openssl x509 -req -in intermediateCA.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out intermediateCA.crt -days 1825 -sha256

sleep 2

openssl genrsa -out nginx.key 2048

sleep 2

openssl req -new -key nginx.key -out nginx.csr

sleep 2

openssl req -new -key nginx.key -out nginx.csr

sleep 2

openssl req -new -key nginx.key -out nginx.csr

sleep 2

openssl x509 -req -in nginx.csr -CA intermediateCA.crt -CAkey intermediateCA.key -CAcreateserial -out nginx.crt -days 825 -sha256

sleep 2

cat intermediateCA.crt rootCA.crt > chain.crt

mkdir -p /etc/nginx/ssl/

mv nginx.* /etc/nginx/ssl/

mv chain.crt /etc/nginx/ssl/

# apt update -y && apt upgrade -y && apt install vim -y


cat <<EOF > /etc/nginx/conf.d/default.conf

server {
    listen       80;
    listen  [::]:80;
    server_name  localhost;

    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    #location ~ \.php$ {
    #    root           html;
    #    fastcgi_pass   127.0.0.1:9000;
    #    fastcgi_index  index.php;
    #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
    #    include        fastcgi_params;
    #}

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}

server {
    listen 443 ssl;
    server_name your_domain;

    ssl_certificate /etc/nginx/ssl/nginx.crt;
    ssl_certificate_key /etc/nginx/ssl/nginx.key;
    ssl_trusted_certificate /etc/nginx/ssl/chain.crt;

    ssl_stapling off;
    # Other configurations
}

EOF


nginx -t


nginx -s reload
