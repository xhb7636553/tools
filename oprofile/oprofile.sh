#部分系统不支持time interrupt，会导致抓不到数据，可使用modprobe oprofile timer=1
#查看状态：dmesg|grep oprofile，会追加多一行

#!/bin/bash

if [ $# -ne 1 ];then
	echo "Usage: oprofile.sh command"
	echo 'Example: /root/oprofile/oprofile.sh "php redis.php"'
	exit 2;
fi

log_file=/tmp/oprofile_msessage.log

#file_path=$1
#if [ ! -d "$myPath"]; then 
#	echo "$1 not exists;"
#fi
echo `date -d "today" +%Y%m%d%H%M%S` 

opcontrol --start  --no-vmlinux 
opcontrol --reset
$1 
opcontrol --dump
opreport -l
opcontrol --stop 
opcontrol --shutdown 
