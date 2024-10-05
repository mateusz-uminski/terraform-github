# terraform-github

[![verify](https://github.com/mateusz-uminski/terraform-github/actions/workflows/verify.yaml/badge.svg)](https://github.com/mateusz-uminski/terraform-github/actions/workflows/verify.yaml)

This terraform code is used for creating and managing github repositories in my account. Besides the README.md further documentation can be found in commits and code comments.

Feel free to explore and copy everything you want. Enjoy!


# Requirements
1. Terraform version ~> 1.3.3
2. An AWS account
3. An GitHub account


# Prerequisites
1. Add `github-state` profile to your `~/.aws/credentials` and `~/.aws/config` files.


# Usage

1. Init working directory:
```sh
terraform init
```

2. Ensure that `GITHUB_TOKEN` environment variable is set:
```sh
export GITHUB_TOKEN=<github-token>
```

3. Create an execution plan:
```sh
terraform plan
```
