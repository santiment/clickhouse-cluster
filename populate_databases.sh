./invoke_sql.sh ch_aws_1 db.sql
./invoke_sql.sh ch_aws_2 db.sql
./invoke_sql.sh ch_hetzner_1 db.sql
./invoke_sql.sh ch_hetzner_2 db.sql

./invoke_sql.sh ch_aws_1 shard_table.sql
./invoke_sql.sh ch_aws_2 shard_table.sql
./invoke_sql.sh ch_hetzner_1 shard_table.sql
./invoke_sql.sh ch_hetzner_2 shard_table.sql

./invoke_sql.sh ch_aws_1 facing_distributed_table.sql
./invoke_sql.sh ch_hetzner_1 facing_distributed_table_for_computation_cluster.sql

./invoke_sql.sh ch_hetzner_1 computation_tables.sql
./invoke_sql.sh ch_hetzner_1 computation_data.sql
