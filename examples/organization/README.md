# Organization Example

This example demonstrates how to create an AWX Organization using the `organization` module.

## Usage

```bash
terraform init
terraform plan -var="awx_password=<your-password>"
terraform apply -var="awx_password=<your-password>"
```

Or use a `.tfvars` file (not committed to source control):

```hcl
awx_hostname = "https://awx.example.com"
awx_username = "admin"
awx_password = "supersecret"
```
