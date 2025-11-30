# Troubleshooting

Common issues and resolutions for the **CDC Pipeline**.

## DMS Issues

### 1. Replication Task Fails to Start

**Symptom:** Task stuck in "Creating" or fails immediately.

**Resolution:**
- Check source database connectivity from DMS subnet
- Verify database credentials in Secrets Manager
- Check security group allows DMS to source database
- Verify source database has CDC enabled (e.g., logical replication for PostgreSQL)

### 2. High Replication Lag

**Symptom:** CDC events delayed by minutes/hours.

**Resolution:**
- Check source database load – high write volume causes lag
- Increase DMS instance size
- Review table mappings – exclude unnecessary tables
- Check network bandwidth between DMS and source

### 3. Missing CDC Events

**Symptom:** Some database changes not appearing in stream.

**Resolution:**
- Verify table is included in replication task
- Check source database transaction log retention
- Review DMS task logs for errors
- Ensure primary key exists on source tables

## Streaming Issues

### 4. Kafka Consumer Lag

**Symptom:** Consumers falling behind producers.

**Resolution:**
- Add more consumer instances
- Increase partition count for topic
- Check consumer processing time – optimize logic
- Verify consumer group is healthy

### 5. Kinesis Throttling

**Symptom:** `ProvisionedThroughputExceededException` errors.

**Resolution:**
- Increase shard count
- Switch to on-demand capacity mode
- Implement exponential backoff in producers
- Batch records to reduce API calls

## Processing Issues

### 6. Lambda Processing Errors

**Symptom:** Events failing in Lambda processor.

**Resolution:**
- Check CloudWatch logs for error details
- Verify event schema matches expected format
- Check downstream service availability
- Review DLQ for failed events

### 7. Schema Evolution Failures

**Symptom:** Events rejected due to schema mismatch.

**Resolution:**
- Update schema registry with new version
- Ensure backward compatibility
- Coordinate schema changes with consumers
- Use schema validation in producers

## Cost Issues

### 8. Unexpected High Costs

**Symptom:** Monthly bill higher than estimates.

**Resolution:**
- Review DMS instance utilization – right-size
- Check Kafka storage – implement retention policies
- Review Kinesis shard count – consolidate if possible
- Implement event filtering at source

> For architecture details, see the project README.
