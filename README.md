<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# Terraform Module template

This repository is meant to be a template for creating new terraform modules.

## Creating a new Terraform Module

1. Clone this repo, renaming appropriately.  
1. Write your terraform code in the root dir.  
1. Ensure you've completed the [Developer Setup](#developer-setup).  
1. In the root dir, run `go mod init MODULE_NAME` to get a new `go.mod` file. Then run `go mod tidy`. This creates a new `go.sum` file and imports the dependencies and checksums specific to your repository.  
1. Run your tests to ensure they work as expected using instructions below.

---

<!-- DELETE ABOVE THIS LINE -->

## Description

Please put a description of what this module does here

## Usage

Add Usage information here

Resources:

* [Article Example](https://article.example.com)

```hcl
module "example" {
  source = "dod-iac/example/aws"

  tags = {
    Project     = var.project
    Application = var.application
    Environment = var.environment
    Automation  = "Terraform"
  }
}
```

## Terraform Version

Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to master branch.

Terraform 0.11 and 0.12 are not supported.

## License

This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.

## Developer Setup

Install dependencies (macOS)

```shell
brew install pre-commit terraform terraform-docs
pre-commit install --install-hooks
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) |
| [aws_partition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) |
| [aws_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| tags | Tags applied to the AWS resources. | `map(string)` | `{}` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
