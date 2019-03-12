
LOGIN_USERNAME=$(shell echo "$DOCKER_LOGIN_USERNAME")
LOGIN_PASSWORD=$(shell echo "$DOCKER_LOGIN_PASSWORD")
VERSION=2019.03.01

.PHONY: build deploy ci

default: build

build:
	@echo "building arch tag:$(TAG)"
	@./build $(VERSION)
deploy:
	@echo "logging into docker"
	@docker login -u $(LOGIN_USERNAME) -p $(LOGIN_PASSWORD)
	@echo "deploying arch"
	@./deploy $(VERSION)
ci: build deploy