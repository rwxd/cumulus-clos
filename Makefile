help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: setup clean test run ## run everything

.PHONY: test
test: lint typing unit integration ## run all tests

.PHONY: setup
setup: ## install required modules
	@echo 'Starting setup'
	python -m pip install -r requirements.txt --quiet
	@echo 'Completed setup'

