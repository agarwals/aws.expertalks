#!/bin/bash

# For EBS-backed: ami-2a045778
# For instance-backed: ami-bc0556ee

REGION=ap-southeast-1
AVAILABILITY_ZONE=ap-southeast-1a
IMAGE_ID=ami-2a045778
#IMAGE_ID=ami-bc0556ee
INSTANCE_TYPE=t1.micro
KEY_NAME=krishnan
COUNT=$1
SECURITY_GROUP=$2

# Launch instances
start=$(aws ec2 run-instances --region ${REGION} --placement AvailabilityZone=${AVAILABILITY_ZONE} --image-id ${IMAGE_ID} --security-groups ${SECURITY_GROUP} --instance-type ${INSTANCE_TYPE} --key-name ${KEY_NAME} --count ${COUNT})

# Grab reservation-id
RESERVATION_ID=$(echo $start | awk '{print $2}')
echo ${RESERVATION_ID}

# Iterate through instances created under this reservation-id and obtain hostnames
# Write hostnames to manifest
