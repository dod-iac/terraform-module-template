<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# Terraform Module template

This repository is meant to be a template for creating new terraform modules.

## Creating a new Terraform Module

1. Clone this repo, renaming appropriately.
1. Write your terraform code in the root dir.
1. Ensure you've completed the [Developer Setup](#developer-setup).
1. In the root dir, modify the `module` line for the repo path. Then run `make tidy`, which updates the `go.sum` file and downloads dependencies.
1. Update the terratest tests in the examples and test directories.
1. Run your terratest tests to ensure they work as expected using instructions below.

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

## Testing

Run all terratest tests using the `terratest` script.  If using `aws-vault`, you could use `aws-vault exec $AWS_PROFILE -- terratest`.  The `AWS_DEFAULT_REGION` environment variable is required by the tests.  Use `TT_SKIP_DESTROY=1` to not destroy the infrastructure created during the tests.  Use `TT_VERBOSE=1` to log all tests as they are run.  Use `TT_TIMEOUT` to set the timeout for the tests, with the value being in the Go format, e.g., 15m.  The go test command can be executed directly, too.

## Terraform Version

Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to master branch.

Terraform 0.11 and 0.12 are not supported.

## License

This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.

## Developer Setup

This template is configured to use aws-vault, direnv, go, pre-commit, terraform-docs, and tfenv.  If using Homebrew on macOS, you can install the dependencies using the following code.

```shell
brew install aws-vault direnv go pre-commit terraform-docs tfenv
pre-commit install --install-hooks
```

If using `direnv`, add a `.envrc.local` that sets the default AWS region, e.g., `export AWS_DEFAULT_REGION=us-west-2`.

If using `tfenv`, then add a `.terraform-version` to the project root dir, with the version you would like to use.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_account_alias.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_account_alias) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to the AWS resources. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
