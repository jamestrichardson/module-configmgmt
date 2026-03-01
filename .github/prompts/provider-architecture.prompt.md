```prompt
# AWX Provider Architecture guidelines for module-configmgmt
#
# This prompt file provides guidance on working with the dual Terraform provider
# architecture used in this repository.

## Provider Overview

This repository uses two distinct Terraform providers for AWX:

### Provider 1: denouche/awx (>= 0.24)

**Purpose:** Core AWX infrastructure and configuration objects

**Use this provider for:**
- Organizations (`awx_organization`)
- Teams (`awx_team`)
- Role-Based Access Control (RBAC) assignments
- Inventories (`awx_inventory`)
- Projects (`awx_project`)
- Credentials (`awx_credential`)
- Job Templates
- Workflow Templates
- Users

**Example `versions.tf`:**
```hcl
terraform {
  required_version = ">= 1.3"
  required_providers {
    awx = {
      source  = "denouche/awx"
      version = ">= 0.24"
    }
  }
}
```

### Provider 2: ilijamt/awx (>= 0.7)

**Purpose:** Execution Environments and controller-level settings

**Use this provider for:**
- Execution Environments (`awx_execution_environment`)
- Organization default Execution Environment configuration
- Organization allowed Execution Environments
- AWX/Tower controller settings
- System-level configuration

**Example `versions.tf`:**
```hcl
terraform {
  required_version = ">= 1.3"
  required_providers {
    awx = {
      source  = "ilijamt/awx"
      version = ">= 0.7"
    }
  }
}
```

## Module Design Principles

### 1. Single Provider per Module (Preferred)

When creating new modules, prefer using only one provider per module:

```
modules/
  organization/      # denouche/awx only
  team/              # denouche/awx only
  execution_environment/  # ilijamt/awx only
  settings/          # ilijamt/awx only
```

**Benefits:**
- Cleaner provider dependency management
- Easier to migrate if providers consolidate
- Simpler module composition
- Clearer separation of concerns

### 2. Provider Aliasing for Dual-Provider Modules

If a module **must** use both providers, use provider aliases:

```hcl
# versions.tf
terraform {
  required_version = ">= 1.3"
  required_providers {
    awx_core = {
      source  = "denouche/awx"
      version = ">= 0.24"
    }
    awx_ee = {
      source  = "ilijamt/awx"
      version = ">= 0.7"
    }
  }
}

# main.tf
resource "awx_core_organization" "this" {
  provider = awx_core
  name     = var.name
}

resource "awx_ee_execution_environment" "default" {
  provider = awx_ee
  name     = var.ee_name
}
```

### 3. Module Naming Conventions

Module names should clearly indicate the AWX resource type:

- `organization` – manages AWX organizations (denouche/awx)
- `team` – manages teams and RBAC (denouche/awx)
- `inventory` – manages inventories (denouche/awx)
- `execution_environment` – manages EEs (ilijamt/awx)
- `ee_binding` – manages org default/allowed EEs (ilijamt/awx)
- `settings` – manages controller settings (ilijamt/awx)

### 4. Documentation Requirements

Every module README **must** clearly document which provider(s) it uses:

```markdown
# AWX Organization Terraform Module

**Provider:** [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) >= 0.24

This module manages AWX organizations using the `awx_organization` resource.
```

## Migration Preparedness

The dual-provider architecture may consolidate in the future. To prepare:

### Do:
- ✅ Keep provider-specific resources in separate modules
- ✅ Use clear naming conventions indicating provider usage
- ✅ Document which provider each module uses
- ✅ Avoid unnecessary cross-provider dependencies
- ✅ Design module interfaces independent of provider implementation

### Don't:
- ❌ Hard-code provider assumptions in variable names
- ❌ Create tight coupling between modules using different providers
- ❌ Mix provider concerns within a single resource block
- ❌ Use provider-specific attributes in module outputs without documentation

## Examples Directory Structure

Examples should demonstrate both single-provider and multi-provider usage:

```
examples/
  organization/          # denouche/awx only
  team/                  # denouche/awx only
  execution_environment/ # ilijamt/awx only
  complete/              # Shows both providers working together
```

## Troubleshooting Provider Issues

### Issue: Provider version conflicts

If you see provider version conflicts, check:
1. Each module's `versions.tf` declares only the provider(s) it uses
2. Root module passes the correct provider to each module
3. Provider aliases are used correctly in dual-provider scenarios

### Issue: Resource not found in provider

If a resource doesn't exist in a provider:
1. Verify you're using the correct provider for that resource type
2. Check provider documentation for resource availability
3. Consider if the resource belongs in a different module

### Issue: Provider authentication errors

Both providers should use the same authentication credentials:

```hcl
provider "awx" {
  hostname = var.awx_hostname
  username = var.awx_username
  password = var.awx_password
  insecure = var.awx_insecure
}
```

Use provider aliases if different credentials are needed (rare).

## Future Consolidation Strategy

When/if providers consolidate:

1. **Module interfaces remain stable** – users won't need to change how they
   call modules
2. **Update `versions.tf`** – change provider source in affected modules
3. **Update documentation** – reflect new provider in README files
4. **Test thoroughly** – verify all resources work with consolidated provider
5. **Deprecate gradually** – provide migration guides for users

The modular design ensures this transition will be smooth and low-impact.
```
