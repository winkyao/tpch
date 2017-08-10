#!/bin/bash
set -e
CURDIR=$(cd `dirname $0`; pwd)
OUTDIR=$CURDIR/$1

if [ ! -d $OUTDIR ]; then
  mkdir -p $OUTDIR
fi

cd $CURDIR
for file in `ls mysql/*.sql`; do
  name=${file%.*}
  name=${name##mysql\/}
  outputfile=$OUTDIR/$name.out
  mysql -h 127.0.0.1 -P 4000 -u root -D tpch < $file >$outputfile
done
