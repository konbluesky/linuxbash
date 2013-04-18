#!/bin/bash
#Author:root#nightx.info
#login renren.com

echo "[+]人人网好友姓名提取"
echo "[+]Author:root#nightx.info"
read -p "[+]Username(email):" email
read -s -p "[+]Password:" password
echo
echo "[+]登录中..."
curl -s -d "email=$email&password=$password&origURL=renren.com" http://www.renren.com/PLogin.do --cookie-jar renren.txt -o out.html
curl -s 'http://icode.renren.com/getcode.do?t=login&rnd=Math.random()' --cookie-jar renren.txt > code.jpg
pwd=`pwd`
eog $pwd/code.jpg 2>> /dev/null
read -p "[+]请输入验证码:" code
curl -s -d "email=$email&password=$password&icode=$code&origURL=renren.com" http://www.renren.com/PLogin.do --cookie renren.txt -o out.html
url=`cat out.html | egrep 'http://.*se' -o`
curl -s -L  $url --cookie-jar renren.txt -o out.html
curl -s "http://friend.renren.com/myfriendlistx.do" --cookie renren.txt -o out.html
cat out.html | sed 's/\",\"head.\{1,280\},\"name\":\"/\n/g' | grep '\\u.*' | sed 's/var.*\":\"//g' | sed 's/\".*\;//g' | native2ascii -reverse > friend.list
rm -rf out.html code.jpg
echo "[+]已输出好友列表至friend.list文件"
cat -n friend.list
