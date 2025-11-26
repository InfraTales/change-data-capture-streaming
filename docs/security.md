# Security Overview

This document summarizes the security posture of the **CDC Pipeline** architecture.

## Defense-in-Depth

The pipeline applies multiple layers of security controls:

### Identity & Access (IAM)

- Least-privilege IAM roles for DMS, Lambda, and Kinesis
- Separate roles for source access, replication, and downstream processing
- Cross-account access controls for multi-account data flows
- Database credentials stored in Secrets Manager

### Data Protection

- **Source databases**: TLS connections to source databases
- **DMS replication**: Encrypted replication instances
- **Kafka/Kinesis**: KMS encryption for streams at rest
- **S3 archives**: Server-side encryption with customer-managed keys
- **In transit**: TLS 1.2+ for all data movement

### Network Isolation

- DMS replication instances in private VPC subnets
- MSK cluster deployed in private subnets
- VPC endpoints for Kinesis and S3 access
- Security groups restricting database access to DMS only

### Data Governance

- Schema registry for event format validation
- Data masking for sensitive fields in CDC events
- Audit logging of all data access
- Retention policies aligned with compliance requirements

## Compliance Considerations

The architecture supports:

- SOC 2 Type II controls
- PCI-DSS data protection (with field-level encryption)
- GDPR data handling requirements
- HIPAA audit logging

> For detailed security configurations, see `SECURITY.md` in the project root.
