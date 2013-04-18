#!/bin/bash
#@seclouded
#unzip js file

if [ $# -ne 1 ]
then
echo "Usage: $0 filename"
exit -1
fi

filename=$1

cat $filename | sed 's/;/;\n/g;s/{/{\n\n/g;s/}/\n\n}/g'
