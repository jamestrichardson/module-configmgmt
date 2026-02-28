# Complete Example

This example demonstrates how to use all available AWX modules together to provision:
- An **Organization**
- Two **Teams** (ops and dev) within the organization
- A **Credential** (source control)
- An **Inventory** with host groups

## Usage

```bash
terraform init
terraform plan -var="awx_password=<your-password>"
terraform apply -var="awx_password=<your-password>"
```

Or with a `.tfvars` file (not committed to source control):

```hcl
awx_hostname = "https://awx.example.com"
awx_username = "admin"
awx_password = "supersecret"
name_prefix  = "myproject"
max_hosts    = 50
scm_username = "git-user"
scm_password = "git-token"
```
