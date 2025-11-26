# Cost Analysis (₹)

This document provides cost estimates for the **CDC Pipeline** architecture in **Indian Rupees (₹)**.

## Production Environment

At production scale (high-throughput replication), the architecture typically costs:

| Service | Monthly Cost (₹) | Notes |
|---------|------------------|-------|
| **DMS Replication** | ₹25,000–45,000 | dms.r5.large or larger |
| **MSK (Kafka)** | ₹40,000–70,000 | kafka.m5.large cluster |
| **Kinesis Data Streams** | ₹15,000–30,000 | Shard hours + data transfer |
| **Lambda (processors)** | ₹8,000–15,000 | Event processing functions |
| **S3 (data lake)** | ₹5,000–10,000 | CDC event archives |
| **CloudWatch** | ₹3,000–5,000 | Monitoring and logs |
| **Total** | **₹100,000–180,000** | ~$1,250–2,250/month |

## Development Environment

For dev/staging environments:

| Environment | Approx Monthly Cost (₹) | Notes |
|------------|--------------------------|-------|
| Dev | ₹20,000–35,000 | Single-node Kafka, minimal DMS |
| Staging | ₹50,000–80,000 | Multi-node, moderate throughput |
| Production | ₹100,000–180,000 | Full HA, high throughput |

## Cost Optimization Strategies

- **Right-size DMS** – Match instance to actual throughput needs
- **MSK Serverless** – Consider for variable workloads
- **Kinesis on-demand** – Use for unpredictable traffic patterns
- **Batch processing** – Aggregate events to reduce Lambda invocations
- **S3 lifecycle** – Archive old CDC events to Glacier
- **Reserved capacity** – Use for predictable DMS/MSK workloads

## Related Documentation

See `ARCHITECTURE.md` for service details and `DEPLOYMENT.md` for configuration options.
