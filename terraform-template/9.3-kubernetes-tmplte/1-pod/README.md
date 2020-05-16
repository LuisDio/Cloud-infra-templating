1. Initialize Terraform:
```terraform init```

2. Validate main.tf:
```terraform validate```

3. Plan the deployment:
```terraform plan```

4. Deploy the pod:
```terraform apply -auto-approve```

5. List the Pods:
```kubectl get pods```

6. Reset the environment:
```terraform destroy -auto-approve```