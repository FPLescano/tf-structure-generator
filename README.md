# Terraform Project Boilerplate

## Project Structure
![Terraform Structure](./img/image.png)
>*Image source/credits: [https://www.linkedin.com/in/jaswindder-kummar/]*

This script automates the creation of a professional, production-ready Terraform directory structure.

## Structure Overview
- **environments/**: Isolated configurations for Dev and Prod.
- **modules/**: Reusable infrastructure components.
- **policies/**: Security and compliance using Sentinel and OPA.
- **scripts/**: Automation wrappers for CI/CD.

## Usage
1. Clone the repo.
2. Run the script:
   ```bash
   chmod +x setup_tf.sh
   ./setup_tf.sh

   ## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

