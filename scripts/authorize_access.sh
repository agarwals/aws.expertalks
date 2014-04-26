#!/bin/bash

REGION=ap-southeast-1
SECURITY_GROUP_NAME=$1
PORT=$2

while read line
do
        echo "Authorizing" $line "to group" $SECURITY_GROUP "to access TCP port" $PORT
	retval=$(aws ec2 authorize-security-group-ingress --region ${REGION} --group-name ${SECURITY_GROUP_NAME} --protocol tcp --port ${PORT} --cidr ${line}/32)
	echo $retval
done < manifest.ips.out
