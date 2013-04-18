#!/bin/bash
#Author root#nightx.info
#remove dumlicate files

ls -lS | awk 'BEGIN {
getline;getline;
name1=$8;size=$5
}
{ name2=$8; if (size==$5)
{
"md5sum " name1 | getline; csum1=$1;
"md5sum " name2 | getline; csum2=$1
if  ( csum1 == csum2 )
{ print name1; print name2 }
};
size= $5; name1=name2;
}' | sort -u > duplicate_file
cat duplicate_file | xargs -I {} md5sum {} | sort | uniq -w 32 | awk '{ print $2 }' | sort -u > duplicate_sample
echo Removing...
comm duplicate_file duplicate_sample -2 -3 | tee /dev/stderr | xargs rm
echo Removed duplicate files successfully.
cat duplicate_sample | xargs echo The rest file name is
rm -rf duplicate_sample duplicate_file
