#!/bin/bash
#Author root#nightx.info
#检查单词是否正确
word=$1
grep "^$1$" /usr/share/dict/british-english -q
if [ $? -eq 0 ]
then
echo "$word is a dictionary word ;-)"
else
echo "Maybe you are wrong :-( "
fi
