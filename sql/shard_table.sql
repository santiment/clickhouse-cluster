CREATE TABLE IF NOT EXISTS shard.metrics_shard (
  event_date           Date,
  metric_id           UInt32,
  value           UInt32
) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{shard}/metrics', '{host}')
PARTITION BY toYYYYMM(event_date)
ORDER BY(intHash32(metric_id))
SAMPLE BY intHash32(metric_id);
