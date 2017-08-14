#!/bin/bash
remove_null() {
for file in `ls $1/*`; do
	sed -i '/^NULL$/d' $file
done
}

if [ $# -eq 0 ]; then
	remove_null tidb_r
	remove_null mysql_r
else
	remove_null $*
fi

