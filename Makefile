.PHONY: deploy run-test all  clean

all: deploy run-test

deploy:
	@echo "Deploying Wallarm Ingress + HTTPBin..."
	helm upgrade -i  wallarm-ingress wallarm/wallarm-ingress -f values.yaml --namespace wallarm --create-namespace --version 6.1.0
	kubectl apply -f httpbin.yaml -n demo

run-test:
	bash run_gotestwaf.sh

clean:
	kubectl delete ns demo
	kubectl delete ns wallarm
