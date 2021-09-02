/**
 * # Terraform Module template
 *
 * This repository is meant to be a template for creating new terraform modules.
 *
 * ## Creating a new Terraform Module
 *
 * 1. Clone this repo, renaming appropriately.
 * 1. Write your terraform code in the root dir.
 * 1. Ensure you've completed the [Developer Setup](#developer-setup).
 * 1. In the root dir, modify the `module` line for the repo path. Then run `make tidy`, which updates the `go.sum` file and downloads dependencies.
 * 1. Update the terratest tests in the examples and test directories.
 * 1. Run your terratest tests to ensure they work as expected using instructions below.
 *
 * ---
 *
 * <!-- DELETE ABOVE THIS LINE -->
 *
 * ## Description
 *
 * Please put a description of what this module does here
 *
 * ## Usage
 *
 * Add Usage information here
 *
 * Resources:
 *
 * * [Article Example](https://article.example.com)
 *
 * ```hcl
 * module "example" {
 *   source = "dod-iac/example/aws"
 *
 *   tags = {
 *     Project     = var.project
 *     Application = var.application
 *     Environment = var.environment
 *     Automation  = "Terraform"
 *   }
 * }
 * ```
 *
 * ## Testing
 *
 * Run all terratest tests using the `terratest` script.  If using `aws-vault`, you could use `aws-vault exec $AWS_PROFILE -- terratest`.  The `AWS_DEFAULT_REGION` environment variable is required by the tests.  Use `TT_SKIP_DESTROY=1` to not destroy the infrastructure created during the tests.  Use `TT_VERBOSE=1` to log all tests as they are run.  Use `TT_TIMEOUT` to set the timeout for the tests, with the value being in the Go format, e.g., 15m.  The go test command can be executed directly, too.
 *
 * ## Terraform Version
 *
 * Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to master branch.
 *
 * Terraform 0.11 and 0.12 are not supported.
 *
 * ## License
 *
 * This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.
 *
 * ## Developer Setup
 *
 * This template is configured to use aws-vault, direnv, go, pre-commit, terraform-docs, and tfenv.  If using Homebrew on macOS, you can install the dependencies using the following code.
 *
 * ```shell
 * brew install aws-vault direnv go pre-commit terraform-docs tfenv
 * pre-commit install --install-hooks
 * ```
 *
 * If using `direnv`, add a `.envrc.local` that sets the default AWS region, e.g., `export AWS_DEFAULT_REGION=us-west-2`.
 *
 * If using `tfenv`, then add a `.terraform-version` to the project root dir, with the version you would like to use.
 *
 *
 */

data "aws_caller_identity" "current" {}
data "aws_iam_account_alias" "current" {}
data "aws_partition" "current" {}
data "aws_region" "current" {}
