#!/bin/bash
#Author root#nightx.info
#批量重命名

count=1;
for img in *.jpg
do
new=img-$count.${img##*.}

mv "$img" "$new" 2>/dev/null
if [ $? -eq 0 ]
then
echo "Rename $img to $new."
let count++

fi

done
