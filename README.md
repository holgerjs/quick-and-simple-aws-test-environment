IaC Repo for myself for quickly spinning up a test environment in AWS.

## Objectives

- Create an AWS test environment with EC2 instances.
- Access the EC2 instances through AWS System Manager Session Manager and VPC Endpoints.
- Use terraform.
- Use GitHub Actions.

## Prerequisites

### Create IAM Role for SSM

1. Follow the steps for [Creating an IAM role with minimal Session Manager permissions (console)](https://docs.aws.amazon.com/systems-manager/latest/userguide/getting-started-create-iam-instance-profile.html#create-iam-instance-profile-ssn-only)
2. Make sure to replace the value for the `iam_instance_profile` property within the `ec2*instance.tf` file with the value that was chosen as the name of the role in Step 1.

## Manual Deployment

1. Clone the repository
2. Choose a way for authenticating with AWS. See [AWS Provider - Authentication and Configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration) for details.
3. Change into the `terraform` folder.
4. Execute `terraform init`, `terraform plan`, check the plan and subsequently run `terraform apply`

## Remove Resources

Once testing is finished, remove the resources by executing `terraform destroy`
