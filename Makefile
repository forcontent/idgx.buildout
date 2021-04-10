#!make
# Makefile for lazy people
# Dependencies:
# - bash
# - docker

SHELL := /bin/bash
CURRENT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
DOCKER := $(bash docker)

# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`


# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
.PHONY: help
help: ## This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: docs
docs: ## Uses docker to build docs in HTML
	@echo -en "$(GREEN)==> Building docs, hold on !$(RESET)"
	@echo ""
	@mkdocs build

.PHONY: serve
serve: ## Starts mkdocs in "serve" mode
	@echo -en "$(GREEN)==> Starting serve mode !$(RESET)"
	@echo ""
	@mkdocs serve
