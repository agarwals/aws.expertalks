#!/bin/bash

END=$1

for i in $(seq 1 $END)
do
        fullhostname="test"$i
        ssh $fullhostname "/home/ubuntu/testing/start_grinder_agent.sh &"
done
