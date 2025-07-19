# AWS ECR Infrastructure

This repository contains Terraform configurations for managing AWS Elastic Container Registry (ECR) repositories. It provides a complete infrastructure setup for container image storage with automated lifecycle management.

## 🏗️ Infrastructure Overview

This Terraform project manages:

- **AWS ECR Repositories**: Container image repositories for different application templates
- **Image Scanning**: Automated vulnerability scanning on image push
- **Lifecycle Policies**: Automated cleanup of old images to manage storage costs
- **Modular Design**: Reusable ECR module for creating multiple repositories

## 📁 Project Structure

```
terraform-ecr/
├── main.tf                 # ECR repositories configuration
├── providers.tf            # AWS provider configuration
├── backend.tf              # Terraform backend configuration
└── modules/
    └── ecr/
        ├── main.tf         # ECR repository and lifecycle policy logic
        ├── variables.tf    # Module input variables
        └── providers.tf    # Module provider configurations
```

## 🚀 Features

### ECR Repositories
- **Multiple Repositories**: Support for creating multiple ECR repositories
- **Image Scanning**: Automatic vulnerability scanning on push
- **Tag Mutability**: Mutable image tags for development flexibility
- **Lifecycle Management**: Automated cleanup of old images

### Lifecycle Policies
- **Image Retention**: Keeps only the last 10 images per repository
- **Automatic Cleanup**: Removes older images to manage storage costs
- **Tag Agnostic**: Applies to all image tags

## 🔧 Prerequisites

- **Terraform** >= 1.0
- **AWS CLI** configured with appropriate credentials
- **AWS S3 Backend**: Configured S3 bucket for Terraform state storage

## 📋 Requirements

### AWS Requirements
- AWS account with appropriate permissions for:
  - ECR repository creation and management
  - S3 bucket access for Terraform state
  - IAM roles and policies for ECR operations

### Terraform Providers
- `hashicorp/aws` ~> 5.0 - AWS provider

## 🚀 Quick Start

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Review the Plan
```bash
terraform plan
```

### 3. Apply the Configuration
```bash
terraform apply
```

### 4. Access Repository URIs
After successful deployment, you can retrieve the repository URIs:
```bash
terraform output
```

## 🔐 Security Considerations

### Image Security
- **Vulnerability Scanning**: Enabled by default on all repositories
- **Image Tag Mutability**: Set to MUTABLE for development flexibility
- **Lifecycle Policies**: Prevent storage bloat from old images

### Production Security Recommendations

1. **Immutable Tags**: Consider setting `image_tag_mutability = "IMMUTABLE"` for production
2. **Enhanced Scanning**: Enable enhanced scanning for deeper vulnerability detection
3. **Access Control**: Implement proper IAM policies for repository access
4. **Cross-Account Access**: Configure cross-account permissions if needed
5. **Encryption**: Ensure encryption at rest is enabled (default for ECR)

## 🔄 Module Usage

The `modules/ecr` module can be used to create additional ECR repositories:

```hcl
module "my-app-repo" {
  source = "./modules/ecr"

  name = "my-application"
}
```

### Module Variables

| Variable | Type | Description | Required |
|----------|------|-------------|----------|
| `name` | string | The name of the ECR repository | Yes |

## 📊 Outputs

The ECR module provides the following outputs:

| Output | Description |
|--------|-------------|
| `repository_url` | The URL of the repository |
| `repository_arn` | The ARN of the repository |
| `repository_name` | The name of the repository |

## 🧹 Cleanup

To destroy all resources:
```bash
terraform destroy
```

⚠️ **Warning**: This will permanently delete all ECR repositories and their images.

## 🔧 Customization

### Repository Configuration
Modify `modules/ecr/main.tf` to adjust:
- Image scanning settings
- Tag mutability
- Lifecycle policy rules
- Repository tags

### Lifecycle Policy
Modify the lifecycle policy in `modules/ecr/main.tf` to adjust:
- Number of images to retain
- Image selection criteria
- Cleanup rules

## 📝 Notes

- **State Management**: Uses S3 backend for remote state storage
- **Region**: Configured for us-east-1 region
- **Project Tagging**: All resources are tagged with `Project = "unir-tfm"`
- **Lifecycle Policy**: Automatically removes images beyond the retention limit

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with `terraform plan`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
