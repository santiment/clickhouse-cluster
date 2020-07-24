CREATE TABLE IF NOT EXISTS db_second.events_second ON CLUSTER cluster_second (
  event_date           Date DEFAULT toDate(now()),
  company_id           UInt32,
  product_id           UInt32
) ENGINE=ReplicatedMergeTree(
    '/clickhouse/tables/{shard}/events_second', '{replica}',
    event_date,
    (company_id),
    8192
);
