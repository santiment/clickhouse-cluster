./invoke_sql.sh ch1 cluster_first_db.sql
./invoke_sql.sh ch2 cluster_first_db.sql
./invoke_sql.sh ch1 cluster_first_table.sql
./invoke_sql.sh ch1 cluster_first_data.sql

./invoke_sql.sh ch3 cluster_second_db.sql
./invoke_sql.sh ch4 cluster_second_db.sql
./invoke_sql.sh ch3 cluster_second_table.sql
./invoke_sql.sh ch3 cluster_second_data.sql

./invoke_sql.sh ch1 cluster_first_remote_table.sql
