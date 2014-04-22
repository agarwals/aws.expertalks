#!/bin/bash

REGION=ap-southeast-1
AVAILABILITY_ZONE=ap-southeast-1a
IMAGE_ID=ami-2a045778
INSTANCE_TYPE=t1.micro
KEY_NAME=krishnan
COUNT=$1
SECURITY_GROUP=$2

#TODO: tag 'Name'  using a prefix and numbered by index on count

# Launch instances
aws ec2 run-instances --region ${REGION} --placement AvailabilityZone=${AVAILABILITY_ZONE} --image-id ${IMAGE_ID} --security-groups ${SECURITY_GROUP} --instance-type ${INSTANCE_TYPE} --key-name ${KEY_NAME} --count ${COUNT} 

#TODO: Record reservation to query for instances launched.
