### Learning Terraform

to run this first fill out the `dev.tfvars`

do a `terraform plan` to get a summary of what is going to happen
```
terraform plan -var-file="dev.tfvars"
```

make sure what is going to happen is the right thing, then you can do a `terraform apply`
```
terraform apply -var-file="dev.tfvars"
```
