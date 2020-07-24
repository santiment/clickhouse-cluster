CREATE TABLE IF NOT EXISTS db_first.events_first ON CLUSTER cluster_first (
  event_date           Date DEFAULT toDate(now()),
  company_id           UInt32,
  product_id           UInt32
) ENGINE=ReplicatedMergeTree(
    '/clickhouse/tables/{shard}/events_first', '{replica}',
    event_date,
    (company_id),
    8192
);
