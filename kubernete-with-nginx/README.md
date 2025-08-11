Nginx Deployment on Minikube (NodePort)
Prerequisites
Docker Desktop installed and running

Minikube installed

kubectl installed

```
docker --version
minikube version
kubectl version --client
```

1. Start Minikube
We’ll use the Docker driver for local Kubernetes.

```
minikube start --driver=docker
```

2. Create Deployment & Service YAML
Create a file named nginx-deployment.yaml

3. Apply the YAML
```
kubectl apply -f nginx-deployment.yaml
```

Verify resources:
```
kubectl get deployments
kubectl get pods
kubectl get svc
```

4. Access the App
Since we’re using the Docker driver on Windows, direct NodePort access via localhost may not work.
Use:
```
minikube service nginx-service
```

This will:

Open the service in your default browser

Or print the URL (if browser auto-open fails)

5. Clean Up
```
kubectl delete -f nginx-deployment.yaml
minikube delete
```
Notes:

NodePort exposes the app on a port in the range 30000–32767.

With Docker driver, Minikube runs inside a container, so minikube service handles the port forwarding for you automatically.