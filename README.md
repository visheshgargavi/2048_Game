# 2048_Game

In AWS:

  • Create K8s cluster using EKS
    o Including all backing Infrastructure (e.g. VPC, RDS)
    
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

## Edit the argocd-server service to expose

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
