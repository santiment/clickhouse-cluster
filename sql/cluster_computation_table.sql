CREATE TABLE IF NOT EXISTS db_computation.metrics_metadata ON CLUSTER cluster_computation (
  metric_id           UInt32
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{shard}/metrics_metadata', '{replica}')
ORDER BY (metric_id);

CREATE TABLE IF NOT EXISTS db_computation.events ON CLUSTER cluster_computation (
  event_date           Date DEFAULT toDate(now()),
  metric_id           UInt32,
  value           UInt32
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{shard}/events', '{replica}')
ORDER BY (metric_id);
