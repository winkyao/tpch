# tpch

# Generate data

```
make tblclean
make tbl
```
will genera `*.tbl` in dbgen/, details see Makefile.

# Load data
1. use `mysql -h xxx -P xxx -u root < dss.sql` to create tables.
2. use loadalldata.sh to import test data into TiDB, Please change the host and port.

# Run query

use `scripts/run-tpch.sh`

# check answer

run `check_answers.sh`, it will compare MySQL and TiDB output. but this script is not correct in some cases, so I rewrite it in [benchbot](https://github.com/pingcap/octopus)
