#!/bin/bash
for file in `ls $1/*`; do
	sed -i '/NULL/d' $file
done
