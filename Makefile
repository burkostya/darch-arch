
LOGIN_USERNAME=$(shell echo "$DOCKER_LOGIN_USERNAME")
LOGIN_PASSWORD=$(shell echo "$DOCKER_LOGIN_PASSWORD")
CACHED=$(TAG)

.PHONY: build deploy ci

default: build

build:
	@echo "building arch tag:$(TAG)"
	@./build $(TAG)
deploy:
	@echo "logging into docker"
	@docker login -u $(LOGIN_USERNAME) -p $(LOGIN_PASSWORD)
	@echo "deploying arch"
	@./deploy $(TAG)
ci: build deploy