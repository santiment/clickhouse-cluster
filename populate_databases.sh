./invoke_sql.sh ch_aws_1 cluster_facing_db.sql
./invoke_sql.sh ch_aws_2 cluster_facing_db.sql
./invoke_sql.sh ch_hetzner_1 cluster_facing_db.sql
./invoke_sql.sh ch_hetzner_2 cluster_facing_db.sql

./invoke_sql.sh ch_aws_1 cluster_facing_table.sql
./invoke_sql.sh ch_aws_1 cluster_facing_data.sql

./invoke_sql.sh ch_hetzner_1 cluster_computation_db.sql
./invoke_sql.sh ch_hetzner_2 cluster_computation_db.sql

./invoke_sql.sh ch_hetzner_1 cluster_computation_table.sql
./invoke_sql.sh ch_hetzner_1 cluster_computation_data.sql
