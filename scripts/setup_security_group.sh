#!/bin/bash

REGION=ap-southeast-1
SECURITY_GROUP_NAME=$1
DESCRIPTION=$2
MY_IP_ADDRESS=$3

# Create security group by name
aws ec2 create-security-group --group-name ${SECURITY_GROUP_NAME} --description ${DESCRIPTION}

# Authorize security group ingress
## for ssh from this IP address
aws ec2 authorize-security-group-ingress --region ${REGION} --group-name ${SECURITY_GROUP_NAME} --protocol tcp --port 22 --cidr ${MY_IP_ADDRESS}/32

# List security group created
aws ec2 describe-security-groups --group-names ${SECURITY_GROUP_NAME}
