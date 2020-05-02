### Plan the dev deploy:
```terraform plan -out=tfdev_plan -var env=dev```
### Apply the dev plan:
```terraform apply tfdev_plan```
### Plan the prod deploy:
```terraform plan -out=tfprod_plan -var env=prod```
### Apply the prod plan:
```terraform apply tfprod_plan```
### Destroy prod deployment:
```terraform destroy -var env=prod -auto-approve```
### Use environment variables:
```export TF_VAR_env=prod```
### Open the Terraform console:
```terraform console```
### Execute a lookup:
```lookup(var.ext_port, var.env)```
### Exit the console:
```unset TF_VAR_env```