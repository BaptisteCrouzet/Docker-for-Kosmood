# Makefile for your commands ! Use it by typing : make xxcommandxx

# Build docker all even it was built before
build:
	docker-compose up --build --force-recreate --remove-orphans --no-start

# laucnh docker
up:
	docker-compose up

# build docker and launch it
up-build:
	docker-compose up --build

# lanch docker in background
up-silent:
	docker-compose up -d

# Launch docker in production with a production compose version (with the right php.ini)
up-production:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

# enter inside the symfony container with the terminal
sf-terminal:
	docker run -it --entrypoint=/bin/bash kosmooddocker_php

# command to execute if you've never launched the project
sf-first-launch:
	cd symfony www && composer install éé yarn install && php bin/console cache:clear && yarn run dev && cd ..

# command to launch if you haven't yet your DB
sf-db-install:
	cd symfony && php bin/console doctrine:schema:update --force && cd ..
