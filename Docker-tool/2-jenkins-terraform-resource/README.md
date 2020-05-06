### initialize Terraform:
```terraform init```

### Plan the deployment:
```terraform plan -out=tfplan```

### Deploy Jenkins:
```terraform apply tfplan```

### Get the Admin password:
```docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword```