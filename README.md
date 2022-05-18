# 2048_Game

In AWS:

  • Create K8s cluster using EKS
  ```hcl
    o Including all backing Infrastructure (e.g. VPC, RDS)
 ```
    
  • Use GitOps with Flux, Argocd to deploy services
  ```hcl
    o Cert-manager
    o External DNS
    o Cluster-Autoscaler
    o Metrics-server
    o Ingress controller (e.g. nginx)
  ```
    
  • Use GitOps with Flux. Argocd to deploy sample application (e.g. 2048 game) which would at minimum comprise of of deployment, service and Ingress by using Helm or K8s manifests

# Create a EKS cluster using iac(terraform)

```hcl
cd terraform
terraform init
terraform plan
terraform apply
```

# Install Argo CD

```hcl
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

```

## Edit the argocd-server service to expose the argocd UI

```hcl
kubectl edit svc argocd-server -n argocd
change type to in line 78: NodePort
```

- username: admin
- password: 2IIE3cI0SDTgLiA6
## get the argocd password

```hcl
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

## launch application

```hcl
kubectl apply -f aplication.yml
```

## installing cert-manager(lets-encrypt) on local minikube
```hcl
kubectl create namespace cert-manager
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.12.0/cert-manager.yaml
kubectl get po -n cert-manager
```

## Basic commands using kubectl
```hcl
kubectl get po
kubectl get svc
kubectl get deployment
kubectl get rs
kubectl get rc
kubectl delete all --all
kubectl expose deployment/deployment_name --type=NodePort/ClusterIP/LoadBalancer --port=port_number
kubectl get all
kubectl get ing
kubectl get clusterissuer
kubectl describe deployment deployment_name
kubectl get certificate
kubectl get secret
```

## How to add addons and enable
```hcl
minikube addons enable addon_name
minikube addons list
```
