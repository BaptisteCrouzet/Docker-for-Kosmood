FROM node:14.13.1-slim

RUN apt-get update && apt-get install -y git \
    lsb-release \
    libx11-dev \
    libgtk-3-dev

WORKDIR /var/www/

RUN git clone https://github.com/beekeeper-studio/beekeeper-studio.git beekeeper/

WORKDIR /var/www/beekeeper/

RUN yarn install

ENTRYPOINT [ "npx", "vue-cli-service", "electron:serve", "--host", "localhost", "-q" ]
