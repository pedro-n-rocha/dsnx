BINARY_NAME  = dsnx
PWD          = $(shell pwd)
UID = $(shell id -u)
GID = $(shell id -g)

HASH := $(shell git rev-parse --short HEAD)
COMMIT_DATE := $(shell git show -s --format=%ci ${HASH})
BUILD_DATE := $(shell date '+%Y%m%d%H%M%S')
VERSION := ${HASH}
CMD = nerdctl
REPO = reg.epsilon.pt

CONTAINER_IMAGE_NAME  = $(BINARY_NAME):$(HASH)

docker: 
	$(CMD) build -t $(CONTAINER_IMAGE_NAME) .

push: 
	$(CMD) tag  $(CONTAINER_IMAGE_NAME)         $(REPO)/$(CONTAINER_IMAGE_NAME)
	$(CMD) tag  $(REPO)/$(CONTAINER_IMAGE_NAME) $(REPO)/$(BINARY_NAME)
	
	$(CMD) push $(REPO)/$(CONTAINER_IMAGE_NAME)
	$(CMD) push $(REPO)/$(BINARY_NAME)

run:
	$(CMD)  run --cap-add=ALL -v /lib/modules:/lib/modules -it $(CONTAINER_IMAGE_NAME)


.PHONY:  docker push
.SILENT: docker push
