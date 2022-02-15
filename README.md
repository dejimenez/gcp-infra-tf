# GCP infrastructure as code using terraform

Learning how to configure GCP infrastructure using terraform. Create modules that allow configure different parts of a GCP full infrastructure. 

## Local requirements 
Install terraform cli 
[Installation link](https://learn.hashicorp.com/tutorials/terraform/install-cli)


## Test locally

### Clone the repo
```
git clone https://github.com/dejimenez/gcp-infra-tf.git
```

### Navigate to folder with the terraform code
```
cd gcp-infra-tf
```

### Run terraform commands
```
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

### CI-CD
The CI is build using github actions. There are two main workflows one to plan what should be done, it is trigger when creating a PR to the main branch, the other one is when pushing to main branch, in this case it will apply the changes done in the files.

### Secrets 
It is necessary to set some secrets to by able to access GCP and make the transformations there.