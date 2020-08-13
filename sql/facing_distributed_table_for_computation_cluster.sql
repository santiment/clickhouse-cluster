CREATE TABLE default.metrics_distributed ON CLUSTER cluster_computation AS shard.metrics_shard
ENGINE = Distributed(cluster_computation, shard, metrics_shard, metric_id);
