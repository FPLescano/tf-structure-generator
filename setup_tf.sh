#!/bin/bash

# Define the base path
BASE_DIR="$(pwd)/your-terraform-project"

# Create the root directory
mkdir -p "$BASE_DIR"
cd "$BASE_DIR"

# 1. Create Environment directories
# Each environment has its own state and configuration files
mkdir -p environments/{dev,prod}
touch environments/{dev,prod}/{main.tf,variables.tf,outputs.tf,terraform.tfvars,backend.tf}

# 2. Create Module directories
# Reusable components for networking, compute, database, and security
mkdir -p modules/{networking,compute,database,security,monitoring}
touch modules/{networking,compute,database,security}/versions.tf
touch modules/{networking,compute,database,security}/{main.tf,variables.tf,outputs.tf}

# Special case: monitoring includes a README.md file
touch modules/monitoring/{main.tf,variables.tf,outputs.tf,README.md,versions.tf}

# 3. Create Policy directories
# Governance and compliance using Sentinel and OPA (Open Policy Agent)
mkdir -p policies/{sentinel,opa}
touch policies/sentinel/{cost-control.sentinel,security-baseline.sentinel,naming-conventions.sentinel}
touch policies/opa/{resource-tagging.rego,network-rules.rego,compliance.rego}

# 4. Create Script directories
# Automation helpers for the CI/CD workflow
mkdir -p scripts
touch scripts/{init.sh,plan.sh,apply.sh,destroy.sh,validate.sh}

# Grant execution permissions to the scripts
chmod +x scripts/*.sh

echo "Terraform structure successfully created at $BASE_DIR"