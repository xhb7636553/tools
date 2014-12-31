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
opreport
opcontrol --stop 
opcontrol --shutdown 
