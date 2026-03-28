# S3 Bucket Terraform Module

This Terraform configuration creates a secure, production-ready S3 bucket with versioning, encryption, and optional lifecycle management.

## Features

- **Versioning**: Enabled by default for data protection
- **Encryption**: Server-side encryption with AES256 and bucket key enabled
- **Public Access**: Completely blocked for security
- **TLS Enforcement**: Bucket policy denies all non-HTTPS requests
- **Lifecycle Management**: Automatic cleanup of old versions and incomplete multipart uploads
- **Access Logging**: Optional S3 access logging for audit trails
- **Tagging**: Comprehensive tagging strategy for resource management

## Usage

### Basic Usage

```hcl
# terraform.tfvars
bucket_name = "my-unique-bucket-name"
environment = "production"
```

### Advanced Configuration

```hcl
# terraform.tfvars
bucket_name                         = "my-app-bucket"
environment                         = "staging"
enable_lifecycle_rules              = true
noncurrent_version_expiration_days  = 30
enable_access_logging               = true

additional_tags = {
  Owner      = "platform-team"
  CostCenter = "engineering"
}
```

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| bucket_name | Name of the S3 bucket (must be globally unique) | string | - | yes |
| aws_region | AWS region for resources | string | us-east-1 | no |
| environment | Environment name (development, staging, production) | string | production | no |
| enable_lifecycle_rules | Enable automatic version management | bool | true | no |
| noncurrent_version_expiration_days | Days before old versions are deleted | number | 90 | no |
| enable_access_logging | Enable S3 access logging | bool | false | no |
| additional_tags | Additional tags to apply | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket_id | The ID of the S3 bucket |
| bucket_arn | The ARN of the S3 bucket |
| bucket_domain_name | The bucket domain name |
| bucket_regional_domain_name | The bucket region-specific domain name |
| versioning_enabled | Whether versioning is enabled |
| logging_bucket_id | The ID of the logging bucket (if enabled) |
| lifecycle_rules_enabled | Whether lifecycle rules are enabled |

## Security Features

### 1. Public Access Block
All public access is blocked at the bucket level, preventing accidental exposure.

### 2. TLS Enforcement
A bucket policy denies all requests that do not use HTTPS, ensuring data in transit is encrypted.

### 3. Server-Side Encryption
AES256 encryption is applied to all objects with bucket key enabled for cost optimization.

### 4. Versioning
Object versioning is enabled to protect against accidental deletions and overwrites.

## Lifecycle Management

When `enable_lifecycle_rules = true`, two lifecycle rules are applied:

1. **Delete Old Versions**: Noncurrent versions are automatically deleted after the specified number of days (default: 90)
2. **Abort Incomplete Uploads**: Incomplete multipart uploads are automatically cleaned up after 7 days

## Access Logging

When `enable_access_logging = true`, a separate logging bucket is created to store S3 access logs. This provides an audit trail for all bucket access.

## Example Deployment

```bash
# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply the configuration
terraform apply

# View outputs
terraform output
```

## Compliance

This configuration follows AWS security best practices:
- CIS AWS Foundations Benchmark
- AWS Well-Architected Framework
- PCI DSS requirements for data storage
