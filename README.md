# Clickhouse cluster on Docker

It is a prototype of Clickhouse cluster deployment to test storing different tables on different hosts but with the ability to use them jointly.

## Cluster structure
Cluster structure is defined in the file `include_from.xml`. There are 2 clusters with sharded facing tables, stored on both clusters and replicated between clusters. And computation tables stored only on cluster: `cluster_computation`. Facing and computation tables on cluster: `cluster_computation` are available in db `default`.  
1. Cluster: `cluster_facing`, DB: `default`, Tables: `metrics_distributed`  
1.1. `ch_aws_1`  
1.2. `ch_aws_2`  
2. Cluster: `cluster_facing`, DB: `shard`, Tables: `metrics_shard`  
2.1. `ch_aws_1`  
2.2. `ch_aws_2`  
3. Cluster: `cluster_computation`, DB: `default`, Tables: `metrics_distributed`, `metrics_metadata`, `events`  
3.1. `ch_hetzner_1`  
3.2. `ch_hetzner_2`  
4. Cluster: `cluster_computation`, DB: `shard`, Tables: `metrics_shard`  
4.1. `ch_hetzner_1`  
4.2. `ch_hetzner_2`  


## Usage

Run the cluster

    docker-compose up

Populate data

    ./populate_databases.sh
    
Execute on the server `ch_hetzner_1` the following request selecting data from computation tables and inserting to the facing table `metrics`:

    ./invoke_sql.sh ch_hetzner_1 cluster_computation_calculate_metrics.sql
As a result of this query, new rows will be added to the tables `metrics_shard` on all servers from `cluster_facing`, together with `ch_aws_1` and `ch_aws_2`.  
    
    
## Solution description

The solution is based on the configuration defining 2 different clusters.  