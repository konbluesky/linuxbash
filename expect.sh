#!/bin/bash
#Author root#nightx.info
#expect自动提交参数

spawn ./input.sh
expect "How old are you?  "
send "19\n"
expect "Your name,please?  "
send "helen\n"
expect eof
