.DEFAULT_GOAL=help
PLATFORM := $(shell uname)

DC=docker-compose
APP=$(DC) exec --user=application app

help:  ## Display this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile \
	  | sort \
	  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[0;32m%-30s\033[0m %s\n", $$1, $$2}'


up: down ## Run the docker container
	$(DC) up -d --build

down: ## Stop the docker containers and remove them
	$(DC) down

clean: ## Stop all docker containers and clean the volumes
	$(DC) down --volumes

bash: ## Connect to the application console
	$(APP) /bin/bash

cs-fix: ## Run cs fix
	$(APP) composer cs-fix
