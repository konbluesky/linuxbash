#!/bin/bash
#字符计数
input=$1
output=`echo $input | sed 's/[^\n]/&\n/g' | sed '/^$/d'| sort | uniq -c | tr -s ' \n'`
echo $output
