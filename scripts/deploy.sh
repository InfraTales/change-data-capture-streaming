#!/bin/bash
set -e

ENVIRONMENT=${1:-dev}
REGION=${2:-us-east-1}

echo "Deploying infrastructure..."
terraform init
terraform validate
terraform plan -var="environment=$ENVIRONMENT" -var="region=$REGION" -out=tfplan
terraform apply tfplan
rm -f tfplan
terraform output
