# Clickhouse cluster on Docker

It is a prototype of Clickhouse cluster deployment to test storing different tables on different hosts but with the ability to use them jointly.

## Cluster structure
2 clusters with one shard and 2 replicas:  
1. `cluster_first`  
1.1. `ch1`  
1.2. `ch2`  
2. `cluster_second`  
2.1. `ch3`  
2.2. `ch4`  



## Usage

Run the cluster

    docker-compose up

Populate data

    ./populate_databases.sh
    
Execute select request joining data from both clusters

    ./invoke_sql.sh ch1 cluster_first_join_request.sql
    
    
## Solution description

The solution is based on the configuration defining 2 different clusters and [`Distributed`](https://clickhouse.tech/docs/en/engines/table-engines/special/distributed/) engine.  
Distributed engine allows us to create a virtual table in which data is actually stored on another cluster and processed too.