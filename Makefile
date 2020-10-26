build:
	docker-compose up --build --force-recreate --remove-orphans --no-start # Build it all and hard
up:
	docker-compose up # laucnh it
up-build:
	docker-compose up --build # build it and launch it
up-silent:
	docker-compose up -d # lanch in background
sf-terminal:
	docker run -it --entrypoint=/bin/bash kosmooddocker_php
