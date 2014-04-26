#!/bin/bash
RESERVATIONID=$1

aws ec2 describe-instances --no-paginate --filters Name=reservation-id,Values=$RESERVATIONID | grep ASSOCIATION | awk '{print $3}' | sort | uniq > manifest.hostnames
