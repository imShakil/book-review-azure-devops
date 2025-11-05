# Deploy Book Review App (3 tier) Using Azure DevOps Pipeline

This project demonstrates deploying a 3-tier book review application to Azure using Infrastructure as Code (IaC) and CI/CD best practices.

## Architecture

- **Frontend**: React/Next.js application
- **Backend**: Node.js API server
- **Database**: AWS RDS

## Deployment Stack

- **Infrastructure**: Terraform for Azure resource provisioning
- **Configuration**: Ansible for application deployment and configuration
- **CI/CD**: Azure DevOps Pipeline for automated deployment

## Getting Started

1. Configure Azure service principal
2. Set up Azure DevOps project
3. Run Terraform to provision infrastructure
4. Execute Ansible playbooks for application deployment
5. Trigger Azure Pipeline for CI/CD automation
