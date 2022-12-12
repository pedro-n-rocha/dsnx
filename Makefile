BINARY_NAME  = dsnx
PWD          = $(shell pwd)
UID = $(shell id -u)
GID = $(shell id -g)

HASH := $(shell git rev-parse --short HEAD)
COMMIT_DATE := $(shell git show -s --format=%ci ${HASH})
BUILD_DATE := $(shell date '+%Y%m%d%H%M%S')
VERSION := ${HASH}
CMD = nerdctl


CONTAINER_IMAGE_NAME  = $(BINARY_NAME):$(HASH)

docker: build
	$(CMD) build -t $(CONTAINER_IMAGE_NAME) .

.PHONY: build
