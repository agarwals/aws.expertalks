#!/bin/bash

idx=0
while read line
do
        hostname=`expr $idx + 1`
	echo "Host test"$hostname >> ssh_config
	echo "  "$line  >> ssh_config
	echo "  User ubuntu" >> ssh_config
	echo "  StrictHostKeyChecking no" >> ssh_config
        echo " " >> ssh_config
	idx=$((idx+1))
done < manifest.hostnames 
