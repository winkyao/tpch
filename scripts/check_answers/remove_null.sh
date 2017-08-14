#!/bin/bash
if [ $# != 1 ]; then
	echo "incorrect param count!"
	exit 1
fi

for file in `ls $1/*`; do
	sed -i '/^NULL$/d' $file
done
