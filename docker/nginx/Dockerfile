FROM nginx:latest

COPY nginx.conf  /etc/nginx/
COPY sites-enabled  /etc/nginx/
COPY sites-available  /etc/nginx/
COPY nginxconfig.io  /etc/nginx/
COPY default.conf  /etc/nginx/

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

EXPOSE 80
EXPOSE 443
