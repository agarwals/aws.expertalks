#!/bin/bash

while read line
do
        echo "Destroying instance" $line
	aws ec2 stop-instances --instance-ids $line
done < manifest.instances.out
