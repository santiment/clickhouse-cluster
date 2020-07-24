CREATE TABLE IF NOT EXISTS db_first.events_remote
ON CLUSTER cluster_first AS db_first.events_first
ENGINE = Distributed(cluster_second, db_second, events_second, rand());
