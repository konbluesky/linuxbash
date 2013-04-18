#!/bin/bash
#Author root#nightx.info
#grep the url and mail from a file

if [ $# -ne 1 ]
then
echo "[+]Usage:$0 filename"
exit -a
fi

file=$1

echo "[+]Emails found."
egrep -o '[A-Za-z0-9.]+@[A-Za-z0-9.]+\.[a-zA-Z]{2,4}' $file | sort | uniq
echo "[+]Urls found."
egrep -o "http://[a-zA-Z0-9.]+\.[A-Za-z]{2,3}" $file | sort | uniq
