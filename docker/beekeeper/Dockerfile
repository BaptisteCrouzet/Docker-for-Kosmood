# Ubuntu base
FROM ubuntu:latest

# Author
LABEL Baptiste Crouzet <mailpro@baptistecrouzet.fr>
# no-interaction when building the Ubuntu image
ARG DEBIAN_FRONTEND=noninteractive
ARG DISPLAY
ARG net

# Install dependencies
RUN apt-get update && apt-get install -yq apt-transport-https ca-certificates wget gnupg git curl

# Install beekeeper-studio GPG key
RUN wget --quiet -O - https://bintray.com/user/downloadSubjectPublicKey?username=bintray | apt-key add -
# Add yarn GPG key
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" |  tee /etc/apt/sources.list.d/yarn.list

# Add beekeeper-studio repo to your apt lists directory
RUN echo "deb https://dl.bintray.com/beekeeper-studio/releases disco main" | tee /etc/apt/sources.list.d/beekeeper-studio.list

# Update apt and install
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 \
    libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 \
    libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 \
    libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 \
    libnss3 snapd beekeeper-studio yarn

# Create the GUI User
###############################################################################
# ENV USERNAME guiuser
# RUN mkdir /etc/sudoers.d/
# RUN useradd -m $USERNAME && \
#     echo "$USERNAME:$USERNAME" | chpasswd && \
#     usermod --shell /bin/bash $USERNAME && \
#     usermod -aG sudo $USERNAME && \
#     echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
#     chmod 0440 /etc/sudoers.d/$USERNAME && \
#     # Replace 1000 with your user/group id
#     usermod  --uid 1000 $USERNAME && \
#     groupmod --gid 1000 $USERNAME
# To run a GUI application, you need to do it from this user! From root type `su guiuser`.

# CMD /usr/bin/firefox


# FROM HERE installk beekeeper-studio source code
WORKDIR /var/www/

RUN git clone https://github.com/beekeeper-studio/beekeeper-studio.git beekeeper/

WORKDIR /var/www/beekeeper/

RUN yarn install && yarn add -D readline

EXPOSE 8080

# ENTRYPOINT [ "npx", "vue-cli-service", "electron:serve", "--host", "localhost", "-q" ]
# ENTRYPOINT [ "/opt/Beekeeper\ Studio/beekeeper-studio-bin || true" ]
# CMD xhost + && xauth add DISPLAY . hexkey && /opt/Beekeeper\ Studio/beekeeper-studio-bin --no-sandbox || true
#systemctl start snapd.service
# CMD /opt/Beekeeper\ Studio/beekeeper-studio --no-sandbox || true

# CMD in order to launch it and keep it running
CMD yarn run electron:serve && tail -f /dev/null
