#!/bin/bash
RESERVATIONID=$1

aws ec2 describe-instances --no-paginate --filters Name=reservation-id,Values=$RESERVATIONID | grep INSTANCES | awk '{print $8}' | sort | uniq > manifest.instances.out
