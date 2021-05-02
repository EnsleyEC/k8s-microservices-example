#..............................................................................#
# Utils

include make-utils/menu-utils.mk
include make-utils/minikube-utils.mk

#..............................................................................#
# Main

KIALI_URL=$(shell minikube ip):31000

.PHONY: deploy-app
deploy-app: install-istio ## [APP] Deploy all manifests k8s
	kubectl apply -f voting-app/deployments
	kubectl apply -f voting-app/services

.PHONY: delete-app
delete-app: ## [APP] Delete all manifests from app
	kubectl delete -f voting-app/deployments --ignore-not-found=true 
	kubectl delete -f voting-app/services --ignore-not-found=true
	$(MAKE) delete-istio

.PHONY: get-app-urls
get-app-urls: ## [APP] Get all urls to access apps from browser
	$(MAKE) minikube-get-service-url -e SERVICE_NAME=result-service
	$(MAKE) minikube-get-service-url -e SERVICE_NAME=voting-service

.PHONY: install-istio
install-istio: ## [ISTIO] Install istio setup
	kubectl apply -f istio/1-istio-init.yaml
	sleep 60
	kubectl apply -f istio/2-istio-minikube.yaml
	kubectl apply -f istio/3-kiali-secret.yaml
	kubectl label namespace default istio-injection=enabled

.PHONY: delete-istio
delete-istio: ## [ISTIO] Delete istio setup
	kubectl label namespace default istio-injection-
	kubectl delete -f istio/ --ignore-not-found=true

.PHONY: get-kiali-url
get-kiali-url: ## [Kiali] Monitoring UI
	@echo URL: http://$(KIALI_URL)