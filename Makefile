DC_BUILD = docker-compose build
DC_UP = docker-compose up
DC_DOWN = docker-compose down


build:
	$(DC_BUILD)

up:
	$(DC_UP)

down:
	$(DC_DOWN)