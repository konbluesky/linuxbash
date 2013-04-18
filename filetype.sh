#!/bin/bash
#list file stat

if  [ $# -ne 1 ];
then
	echo $0 basepath;
	echo
fi

path=$1
declare -A statarray;
while read line;
do
	ftype=`file -b "$line"`
	let statarray["$ftype"]++;

done< <(find $path -type f -print)

echo -e \[+\]File Types And Counts
for ftype in "${!statarray[@]}";
do
	echo $ftype : ${statarray["$ftype"]}
done
