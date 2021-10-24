# creating  custom  vpc in aws.

## step 1
terraform init 

(initialize the working directory containing Terraform configuration files)

## step 2

terraform plan -out output.tf 
(creates an execution plan "-out" is optinal tag used to save plan in a file output.tf)

## step 3

terraform apply "output.tf"

(execute the plan) 

# for clean up 

terraform destroy
