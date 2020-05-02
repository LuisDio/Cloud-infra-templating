## Local Exec with null resource:
we will utilize a Null Resource in order to perform local commands on our machine without having to deploy extra resources.

### Reinitialize Terraform:
```terraform init```

### Validate the changes:
```terraform validate```

### Plan the changes:
```terraform plan -out=tfplan -var env=dev```

### Apply the changes:
```terraform apply tfplan```

### View the contents of container.txt:
```cat container.txt```

### Destroy the deployment:
```terraform destroy -auto-approve -var env=dev```