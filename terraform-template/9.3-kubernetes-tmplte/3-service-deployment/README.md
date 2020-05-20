- Initialize Terraform:
```terraform init```

- Validate the files:
```terraform validate```

- Plan the deployment:
```terraform plan```

- Deploy the pod:
```terraform apply -auto-approve```

- List the Deployments:
```
kubectl get deployments
kubectl get pods
kubectl delete pod [POD_ID]
```

- Reset the environment:
```terraform destroy -auto-approve```