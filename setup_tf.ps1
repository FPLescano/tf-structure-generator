# Define the base path (generic for any user)
$BASE_DIR = Join-Path $HOME "terraform-project-template"

# Create the root directory
New-Item -ItemType Directory -Force -Path $BASE_DIR
Set-Location $BASE_DIR

Write-Host "Creating Terraform structure at $BASE_DIR..." -ForegroundColor Cyan

# 1. Create Environment directories
$envDirs = @("environments/dev", "environments/prod")
foreach ($dir in $envDirs) {
    New-Item -ItemType Directory -Force -Path $dir
    $files = @("main.tf", "variables.tf", "outputs.tf", "terraform.tfvars", "backend.tf")
    foreach ($file in $files) { New-Item -ItemType File -Force -Path (Join-Path $dir $file) }
}

# 2. Create Module directories
$modDirs = @("networking", "compute", "database", "security", "monitoring")
foreach ($mod in $modDirs) {
    $path = "modules/$mod"
    New-Item -ItemType Directory -Force -Path $path
    New-Item -ItemType File -Force -Path "$path/main.tf"
    New-Item -ItemType File -Force -Path "$path/variables.tf"
    New-Item -ItemType File -Force -Path "$path/outputs.tf"
    New-Item -ItemType File -Force -Path "$path/versions.tf"
    if ($mod -eq "monitoring") { New-Item -ItemType File -Force -Path "$path/README.md" }
}

# 3. Create Policy directories
New-Item -ItemType Directory -Force -Path "policies/sentinel"
New-Item -ItemType Directory -Force -Path "policies/opa"
@("cost-control.sentinel", "security-baseline.sentinel", "naming-conventions.sentinel") | ForEach-Object { New-Item -ItemType File -Force -Path "policies/sentinel/$_" }
@("resource-tagging.rego", "network-rules.rego", "compliance.rego") | ForEach-Object { New-Item -ItemType File -Force -Path "policies/opa/$_" }

# 4. Create Script directories
New-Item -ItemType Directory -Force -Path "scripts"
@("init.ps1", "plan.ps1", "apply.ps1", "destroy.ps1", "validate.ps1") | ForEach-Object { New-Item -ItemType File -Force -Path "scripts/$_" }

Write-Host "Terraform structure successfully created!" -ForegroundColor Green