CREATE TABLE IF NOT EXISTS default.metrics_metadata ON CLUSTER cluster_computation (
  metric_id           UInt32
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{shard}/metrics_metadata', '{host}')
ORDER BY (metric_id);

CREATE TABLE IF NOT EXISTS default.events ON CLUSTER cluster_computation (
  event_date           Date DEFAULT toDate(now()),
  metric_id           UInt32,
  value           UInt32
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{shard}/events', '{host}')
ORDER BY (metric_id);
