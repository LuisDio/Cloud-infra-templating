### initialize terraform:
```
export AWS_ACCESS_KEY_ID="[ACCESS_KEY]"
export AWS_SECRET_ACCESS_KEY="[SECRET_KEY]]"
terraform init
```

### Create your terraform.tfvars file and add value of variable


### Validate code:
```terraform validate```

### Deploy the S3 bucket:
```terraform apply -auto-approve```

### Destroy S3 bucket:
```terraform destroy -auto-approve```