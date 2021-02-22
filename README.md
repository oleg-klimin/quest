How to run it:
1. Clone this repository 
`git clone https://github.com/oleg-klimin/quest.git`
2. Switch to **terraform** folder 
`cd quest/terraform`
3. Create **terrform.tfvars** file
 `cp terraform.tfvars.exaple terrform.tfvars`
 and fill it using your values of AWS environment
 
 Expected that:
- you have domain registered in AWS Route53 service
- ssh key pair already created

4. Run `terraform init`
5. Run `terraform plan`
6. Run `terraform apply`
7. Check result. Follow the address shown at `open_in_you_brouser` output