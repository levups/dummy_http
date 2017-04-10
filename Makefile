# hcs/Makefile

# Don't forget : Makefiles use tabs indentation, not spaces !

brew_libs = crystal-lang

setup: ## Install crystal language and dependencies
	@echo "Updating Homebrew ..."                  && brew update
	@echo "Installing services using Homebrew ..." && brew install $(brew_libs)
	@echo "Installing Crystal dependencies ..."    && crystal deps

build: ## Compile the app without optimizations
	@crystal build --release src/http_dummy.cr

release: ## Compile the app for release (optimized binary)
	@crystal build src/http_dummy.cr

test: ## Run the test suite
	@echo "Running tests ..." && KEMAL_ENV=test crystal spec
