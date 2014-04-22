#!/bin/bash

REGION=ap-southeast-1
SECURITY_GROUP_NAME=$1

# List security group created
aws ec2 describe-security-groups --group-names ${SECURITY_GROUP_NAME}

# Delete security group (ensure to run after any instances that use this security group have been terminated)
aws ec2 delete-security-group --region ${REGION} --group-name ${SECURITY_GROUP_NAME}
