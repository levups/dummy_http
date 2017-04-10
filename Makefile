# hcs/Makefile

# Don't forget : Makefiles use tabs indentation, not spaces !

setup: ## Install crystal language and dependencies
	@echo "Updating Homebrew ..."                 && brew update
	@echo "Installing Crystal using Homebrew ..." && brew install crystal-lang
	@echo "Installing Crystal dependencies ..."   && crystal deps

build: ## Compile the app without optimizations
	@echo "Compiling application ..." && crystal build src/http/dummy.cr

release: ## Compile the app for release (optimized binary)
	@echo "Compiling application for release ..." && crystal build --release src/http/dummy.cr

test: ## Run the test suite
	@echo "Running tests ..." && KEMAL_ENV=test crystal spec
