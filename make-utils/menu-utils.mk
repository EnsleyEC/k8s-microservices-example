#..............................................................................#
# Utils

BASENAME=$(shell basename $(CURDIR))

.PHONY: help
help: ## Show help menu
	@awk 'BEGIN {FS = ":.*##"; printf "\n [ DIR: $(BASENAME) ] \n\n Usage:\n  make ... ? [Example: make help] \n \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-35s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

