provider "github" {}

locals {
  repositories = {
    "terraform-github" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "terraform-fmt / lint",
      ]
    },
    "terraform-service-modules" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "terraform-fmt / lint",
      ]
    },
    "terragrunt-aws-organization" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "terragrunt-hclfmt / lint",
        "terraform-fmt / lint",
      ]
    },
    "terraform-aws-modules" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "terraform-fmt / lint",
      ]
    },
    "terraform-noop-provider" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "ansible-collections" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "yamllint / lint",
        "ansible-lint / lint",
        "python-lint / flake8",
        "results",
      ]
    },
    "ansible-playbooks" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "dotfiles" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "github-actions" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "dockerfiles" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "results",
      ]
    },
    "packer-aws" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "packer-fmt / lint",
        "yamllint / lint",
        "python-lint / flake8",
        "terraform-fmt / lint",
      ]
    },
    "vagrant-virtualbox" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "vagrant-validate / lint",
      ]
    },
    "labs" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "simple-static-website" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "k8s-admission-controller" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "k8s-noop-operator" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "grafana-dashboards" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "go-leetcode" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "go-nethttp-healthz" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
    "java-spring-healthz" = {
      protected_branch = "main"
      visibility       = "public"
      license          = "mit"
      required_status_checks = [
        "verify",
      ]
    },
    "python-flask-healthz" = {
      protected_branch       = "main"
      visibility             = "public"
      license                = "mit"
      required_status_checks = []
    },
  }
}

module "repository" {
  source = "github.com/mateusz-uminski/terraform-service-modules//github-repository?ref=github-repository-v0.2.0"

  for_each = local.repositories

  name = each.key

  visibility = each.value.visibility
  license    = each.value.license

  protected_branch       = each.value.protected_branch
  required_status_checks = each.value.required_status_checks
}
