FROM nginx:1.19

# RUN add-apt-repository -y ppa:hda-me/nginx-stable \
# 	&& apt-get update \
# 	&& apt-get install brotli nginx-module-brotli

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

EXPOSE 80
EXPOSE 443
