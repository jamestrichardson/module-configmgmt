---
agent: 'agent'
description: 'Create Terraform modules for Ansible role provisioning with interactive feedback.'
---

Create Terraform modules for Ansible role provisioning based on the following requirements with step-by-step reasoning and interactive feedback:

Requirements: ${input:requirements:What Ansible role configuration do you need? Please describe the target system, desired state, and any specific platforms or versions.}

Use the interactive_feedback tool to gather any additional necessary information from the user to refine their requirements.

Use the ansible-knowledge MCP tool to ensure accuracy and best practices in Ansible role development.
Use the terraform-mcp-server tool to generate the Terraform modules and configurations to meet the refined requirements for Ansible provisioning.
Output the final Terraform modules and Ansible role scaffolding only after confirming all requirements with the user, including any refinements made through interactive feedback.
Include a markdown file with all the requirements gathered along with any you have inferred, the Terraform module structure, and generated code.
Refine all configuration requirements to be Ansible-specific and aligned with best practices, idempotency, and maintainability standards. Be thorough and detailed in your analysis.
If you need to gather more information from the user to refine the requirements, use the interactive_feedback tool to ask clarifying questions before generating the code.

Rules:
    - Terraform should be written using HCL (HashiCorp Configuration Language) syntax.
    - Ansible roles should follow the standard directory structure (tasks, handlers, templates, defaults, vars, files, meta).
    - Follow best practices for Terraform module structure, including the use of variables, outputs, and clear separation of concerns.
    - Ensure that the generated Terraform code properly configures ansible-provisioner or uses local-exec for running Ansible playbooks.
    - Module names should be descriptive, lowercase, and snake_case (e.g., terraform-aws-ansible-provisioner).
    - Ensure that all Ansible role names follow naming conventions: ansible-role-{purpose} (e.g., ansible-role-webserver-config).
    - Ensure that the generated code is well-documented with comments explaining the purpose of each resource, variable, and Ansible task.
    - All Ansible roles should be idempotent - tasks should safely run multiple times without causing issues.
    - When generating Ansible variables, use clear, descriptive names with appropriate defaults in defaults/main.yml.
    - Be sure to include any necessary Terraform provider configurations, variable definitions, and outputs.
    - Ensure the generated Terraform includes a top-level `tags` variable map that is used on all taggable resources, with at least: `Environment`, `Project`, and `Owner`.
    - Ensure that sensitive information such as passwords, API keys, and secrets are not hardcoded in either Terraform or Ansible code. Use variables, vaults, and secret management solutions.
    - Do not assume any prior knowledge about the user's Ansible environment or target infrastructure; always seek clarification when in doubt.
    - Focus on high-level configuration goals rather than low-level implementation details; attempt to map requirements to Ansible roles and modules.
    - Include handlers for service restarts and configuration change notifications in Ansible roles.
    - Provide example playbook(s) showing how to use the generated Terraform modules and Ansible roles together.
    - Before finalizing the code, always confirm with the user that all requirements have been accurately captured and addressed.
    - All output should be created in the `output/ansible/` directory with appropriate subdirectories for Terraform modules and role scaffolding.
