1. Initialize Terraform:
```
export AWS_ACCESS_KEY_ID="[ACCESS_KEY]"
export AWS_SECRET_ACCESS_KEY="[SECRET_KEY]]"
terraform init
```
2. Create a SSH key.
```ssh-keygen```

3. Validate changes:
```terraform validate```

4. Plan the changes:
```terraform plan -out=tfplan -var 'key_name=tfkey' -var 'public_key_path=/home/cloud_user/.ssh/id_rsa.pub'```

5. Apply the changes:
```terraform apply -auto-approve```

6. Provide the values for key_name and public_key_path: key_name: tfkey public_key_path: /home/cloud_user/.ssh/id_rsa.pub
7. Destroy environment:
```terraform destroy -auto-approve```