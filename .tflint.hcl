# .tflint.hcl
# TFLint configuration for Terraform linting.
# See https://github.com/terraform-linters/tflint for details.

plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "awx" {
  # No official TFLint plugin exists for the denouche/awx provider yet;
  # the terraform built-in plugin above handles schema validation via
  # `terraform validate`. This block is a placeholder for future use.
  enabled = false
}

# Rules
rule "terraform_required_providers" {
  enabled = true
}

rule "terraform_required_version" {
  enabled = true
}

rule "terraform_naming_convention" {
  enabled = true
}

rule "terraform_documented_outputs" {
  enabled = true
}

rule "terraform_documented_variables" {
  enabled = true
}

rule "terraform_typed_variables" {
  enabled = true
}
