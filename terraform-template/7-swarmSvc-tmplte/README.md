### Initialize Terraform:
```terraform init```

### Validate the files:
```terraform validate```

### Build a plan:
```terraform plan -out=tfplan -var 'ext_port=8082'```

### Apply the plan:
```terraform apply tfplan```

### List Docker service:
```docker service ls```

### List Docker container:
```docker container ls```

### Destroy the environment:
```terraform destroy -auto-approve -var 'ext_port=8082'```