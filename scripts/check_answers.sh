#!/bin/bash
CURDIR=$(cd `dirname $0`; pwd)
cd $CURDIR/check_answers
./remove_null.sh
./pairs.sh tidb_r mysql_r
