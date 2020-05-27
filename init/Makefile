SHELL := /bin/bash

PORT ?= 27015
TV_PORT ?= 27020
IMAGE_NAME ?= registry.nodisk.space/csgo/init:dev

.PHONY: all clean image stop

all: image

clean:
	docker rmi $(IMAGE_NAME)

image: Dockerfile
	docker build -t $(IMAGE_NAME) .

push:
	docker push $(IMAGE_NAME)

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
	
