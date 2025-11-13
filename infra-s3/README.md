# infra-s3

Terraform config for AiAlpha S3 bucket with lifecycle for temporary files.

## Usage

```bash
cd infra-s3

terraform init

terraform plan \
  -var="candidate_id=61" \
  -var="bucket_name=kandidat-61-data"

terraform apply \
  -var="candidate_id=61" \
  -var="bucket_name=kandidat-61-data"
```
