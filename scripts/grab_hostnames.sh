#!/bin/bash
RESERVATIONID=$1

output=$(aws ec2 describe-instances --filters Name=reservation-id,Values=$RESERVATIONID)
echo $output
