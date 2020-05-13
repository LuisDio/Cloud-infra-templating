1. Create an S3 Bucket
```
Create Bucket.
Enter a Bucket name. The bucket name must be unique.
Make sure the Region is US East (N. Virginia) Click Next.
```

2. Add the Terraform Folder to the Bucket
```
Click on the bucket name.
Click Create folder.
Enter terraform-aws for the folder name.
Click Save.
```

3. Set the Environment Variables
```
export AWS_ACCESS_KEY_ID="[ACCESS_KEY]"
export AWS_SECRET_ACCESS_KEY="[SECRET_KEY]]"
export AWS_DEFAULT_REGION="us-east-1"
```
4. Add Backend to Your Scripts
Create terraform.tf:
```
terraform.tf contents:
terraform {
  backend "s3" {
    key    = "terraform-aws/terraform.tfstate"
  }
}
```

5. Initialize Terraform:
```terraform init -backend-config "bucket=[BUCKET_NAME]"```

6. Validate changes:
```terraform validate```
7. Plan the changes:
```terraform plan```
8. Apply the changes:
```terraform apply -auto-approve```
9. Destroy environment:
```terraform destroy -auto-approve```