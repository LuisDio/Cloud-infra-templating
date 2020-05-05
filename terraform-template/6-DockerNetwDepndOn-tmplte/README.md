### Initialize Terraform:
```terraform init```

### Validate the files:
```terraform validate```

### Build a plan:
```terraform plan -out=tfplan -var 'ext_port=8082'```

### Apply the plan:
```terraform apply tfplan```

### List Docker volumes:
```docker volume inspect mysql_data```

### List the data in mysql_data:
```sudo ls /var/lib/docker/volumes/mysql_data/_data```

### Destroy the environment:
```terraform destroy -auto-approve -var 'ext_port=8082'```