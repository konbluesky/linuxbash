#!/bin/bash
#Author root#nightx.info
#check pass http://rois.fzu.edu.cn/practice/zhuabao/1_2.php

pass=`curl -s http://rois.fzu.edu.cn/practice/zhuabao/1_2.php --cookie-jar cookie.txt | grep -o "(.* " | sed "s/x/*/g" | bc`
echo "pass_key=$pass "
curl -d "pass_key=$pass" http://rois.fzu.edu.cn/practice/zhuabao/1_2.php?action=check_pass --cookie cookie.txt
