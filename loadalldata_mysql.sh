#!/bin/bash
set -e
postfix=scripts
DIR=$PWD
PAR_DIR=${PWD%/$postfix}
DBGEN=$PAR_DIR/dbgen
prefix=$DBGEN/
write_to_tidb()
{
    rm -rf $DBGEN/*.sql
    mysql -u root < dss.sql
    for tbl in `ls $DBGEN/*.tbl`; do
        table=$(echo "${tbl%.*}")
        name=${table#$prefix}
	      sql_file="$table.sql"
	      if [ ! -f "$sql_file" ] ; then
        	  touch "$sql_file"
	      fi
        echo $sql_file
        echo "LOAD DATA LOCAL INFILE '$tbl' INTO TABLE $name" >> $sql_file
        echo "FIELDS TERMINATED BY '|';" >> $sql_file
	mysql -u root --local-infile=1 -D tpch < $sql_file
    done
    echo "finish mysql..."
}

write_to_tidb
