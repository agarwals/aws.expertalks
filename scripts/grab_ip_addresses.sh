#!/bin/bash
RESERVATIONID=$1

aws ec2 describe-instances --no-paginate --filters Name=reservation-id,Values=$RESERVATIONID | grep ASSOCIATION | awk '{print $4}' | sort | uniq > manifest.ips.out
