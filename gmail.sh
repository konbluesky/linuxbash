#!/bin/bash
#Author:root#nightx.info
#login gmail

echo "[+]New Mail List For Gmail"
echo "[+]Author:root#nightx.info"
read -p "[+]Username:" username
read -s -p "[+]Password:" password
echo
echo "---------------------------"
count=5 #默认列出5封未读邮件
curl -u $username:$password -s "https://mail.google.com/mail/feed/atom" | tr -d "\n" | sed 's:</entry>:\n:g' |sed 's/.*<title>\(.*\)<\/title.*<author><name>\(.*\)<\/name><email>\(.*\)<\/email><\/author>/Author:\2\nMail:[\3] \nSubject:\1\n---------------------------/' | head -n $(( $count * 4 ))
