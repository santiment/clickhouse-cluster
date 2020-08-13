CREATE TABLE default.metrics_distributed ON CLUSTER cluster_facing AS shard.metrics_shard
ENGINE = Distributed(cluster_facing, shard, metrics_shard, metric_id);
