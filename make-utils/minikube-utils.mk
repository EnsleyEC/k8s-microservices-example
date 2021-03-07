.PHONY: minikube-start
minikube-start: ## Start k8s cluster
	 minikube start --driver=virtualbox

.PHONY: minikube-stop
minikube-stop: ## Stop k8s cluster
	 minikube stop

.PHONY: minikube-delete
minikube-delete: ## Delete k8s cluster
	 minikube delete

.PHONY: minikube-restart
minikube-restart: ## Restart k8s cluster
	 $(MAKE) minikube-delete
	 $(MAKE) minikube-start

.PHONY: minikube-get-service-url
minikube-get-service-url: ## Get service url ... 'Add -e SERVICE_NAME=...."
	@echo ------------
	@echo SERVICE_NAME=$(SERVICE_NAME)
	@minikube service $(SERVICE_NAME) --url
	@echo ------------