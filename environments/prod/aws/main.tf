terraform {
  backend "s3" {
    bucket         = "company-terraform-state"
    key            = "prod/aws/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "web_vm" {
  source = "../../../modules/aws-vm"

  vm_name            = "prod-web-01"
  ami_id             = "ami-xxxxxxxx"
  instance_type      = "t3.large"
  subnet_id          = "subnet-xxxx"
  security_group_ids = ["sg-xxxx"]
  key_name           = "corp-key"

  tags = {
    Environment = "Production"
    Owner       = "Infrastructure"
    CostCenter  = "IT"
  }
}
