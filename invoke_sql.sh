# Usage: invoke_sql.sh host sql_file
cat ./sql/$2 | docker-compose run --rm ch_client -m -n --host $1
