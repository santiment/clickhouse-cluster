CREATE TABLE IF NOT EXISTS default.metrics_metadata ON CLUSTER cluster_computation (
  metric_id           UInt32
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{shard}/metrics_metadata', '{replica}')
ORDER BY (metric_id);

CREATE TABLE IF NOT EXISTS default.events ON CLUSTER cluster_computation (
  event_date           Date DEFAULT toDate(now()),
  metric_id           UInt32,
  value           UInt32
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{shard}/events', '{replica}')
ORDER BY (metric_id);

CREATE TABLE IF NOT EXISTS default.metrics ON CLUSTER cluster_computation (
  event_date           Date,
  metric_id           UInt32,
  value           UInt32
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{shard}/metrics', '{replica}')
PARTITION BY toYYYYMM(event_date)
ORDER BY(intHash32(metric_id))
SAMPLE BY intHash32(metric_id);
