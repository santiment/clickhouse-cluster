# Clickhouse cluster on Docker

It is a prototype of Clickhouse cluster deployment to test storing different tables on different hosts but with the ability to use them jointly.

## Cluster structure
Cluster structure is defined in the file `include_from.xml`.  
1. `cluster_facing`/db `default`/table `metrics`  
1.1. `ch_aws_1`  
1.2. `ch_aws_2`  
2. `cluster_computation`/db `db_computation`/tables `metrics_metadata`, `events`  
2.1. `ch_hetzner_1`  
2.2. `ch_hetzner_2`  


## Usage

Run the cluster

    docker-compose up

Populate data

    ./populate_databases.sh
    
Execute on the server `ch_hetzner_1` the following request selecting data from `cluster_computation ` and inserting to `cluster_facing`:

    ./invoke_sql.sh ch_hetzner_1 cluster_computation_calculate_metrics.sql
As a result of this query, new rows will be added to the table `metrics` on all servers from `cluster_facing`, together with `ch_aws_1` and `ch_aws_2`.  
    
    
## Solution description

The solution is based on the configuration defining 2 different clusters.  