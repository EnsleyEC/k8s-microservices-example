#..............................................................................#
# Utils

include make-utils/menu-utils.mk
include make-utils/minikube-utils.mk

#..............................................................................#
# Main

.PHONY: deploy-cluster
deploy-cluster: ## Deploy all manifests k8s
	kubectl apply -f voting-app/pods
	kubectl apply -f voting-app/services

.PHONY: get-urls
get-urls: ## get all urls to access apps from browser
	$(MAKE) minikube-get-service-url -e SERVICE_NAME=result-service
	$(MAKE) minikube-get-service-url -e SERVICE_NAME=voting-service