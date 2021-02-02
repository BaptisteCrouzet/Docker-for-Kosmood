FROM nginx:latest

COPY ./docker/nginx/nginx.conf  /etc/nginx/
COPY ./docker/nginx/sites-enabled  /etc/nginx/
COPY ./docker/nginx/sites-available  /etc/nginx/
COPY ./docker/nginx/nginxconfig.io  /etc/nginx/
COPY ./docker/nginx/nginx.conf  /etc/nginx/
COPY ./ docker/nginx/default.conf /etc/nginx/conf.d/
RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

EXPOSE 80
EXPOSE 443
