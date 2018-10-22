# hcs/Makefile

.PHONY: test

# Aliases to everyday takss faster
b : build
r : run
s : setup
t : test

# Don't forget : Makefiles use tabs indentation, not spaces !

setup: ## Install crystal language and dependencies
	@echo "Updating Homebrew ..."                 && brew update
	@echo "Installing Crystal using Homebrew ..." && brew install crystal-lang
	@echo "Installing Crystal dependencies ..."   && crystal deps

run: ## Run the app
	@echo "Running application ..." && crystal run src/dummy_http.cr

build: ## Compile the app without optimizations
	@echo "Compiling application ..." && crystal build src/dummy_http.cr

release: ## Compile the app for release (optimized binary)
	@echo "Compiling application for release ..." && crystal build --release src/dummy_http.cr

test: ## Run the test suite
	@echo "Running tests ..." && KEMAL_ENV=test crystal spec
