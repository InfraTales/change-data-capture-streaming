# Runbook

Operational guide for deploying, operating, and maintaining the **CDC Pipeline**.

## 1. Deployment

### Prerequisites

- AWS CLI configured with appropriate credentials
- Node.js 18+ and npm installed
- AWS CDK CLI installed (`npm install -g aws-cdk`)
- Source database credentials in Secrets Manager

### Deploy Steps

```bash
# Install dependencies
npm install

# Bootstrap CDK (first time only)
cdk bootstrap

# Deploy to dev
cdk deploy --context environment=dev

# Deploy to production
cdk deploy --context environment=prod
```

## 2. Source Configuration

### Add New Source Database

1. Store credentials in Secrets Manager
2. Create DMS source endpoint
3. Configure table mappings
4. Create replication task
5. Start replication

### Supported Sources

- PostgreSQL
- MySQL
- Oracle
- SQL Server
- MongoDB

## 3. Monitoring

### Key Metrics to Watch

- **DMS**: Replication lag, CDC latency, task status
- **Kafka/Kinesis**: Consumer lag, throughput, error rates
- **Lambda**: Invocation errors, duration, throttling
- **End-to-end**: Source-to-sink latency

### Dashboards

Pre-configured dashboards for:

- Replication health overview
- Stream throughput metrics
- Consumer lag tracking
- Error rate monitoring

## 4. Operations

### Pause Replication

```bash
aws dms stop-replication-task --replication-task-arn <arn>
```

### Resume Replication

```bash
aws dms start-replication-task --replication-task-arn <arn> \
  --start-replication-task-type resume-processing
```

### Handle Schema Changes

1. Pause replication task
2. Update table mappings
3. Reload affected tables
4. Resume replication

## 5. Maintenance

### Regular Tasks

- Monitor replication lag daily
- Review DMS task logs weekly
- Update source endpoint credentials before expiry
- Archive old CDC events per retention policy

### Teardown

```bash
cdk destroy --context environment=dev
```

> For troubleshooting common issues, see `docs/troubleshooting.md`.
