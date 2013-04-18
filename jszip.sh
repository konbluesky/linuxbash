#!/bin/bash
#zip js file

if [ $# -ne 1 ]
then
echo "Usage: $0 filename."
exit -1
fi

file=$1

cat $file | tr -d '\n\t' | tr -s ' ' | sed 's:/\*.*\*/::g' | sed 's/ \?\([{}();,:]\) \?/\1/g'

