#!/bin/bash
cd check_answers
./remove_null.sh
./pairs.sh tidb_r mysql_r
