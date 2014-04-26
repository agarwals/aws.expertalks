#!/bin/bash

export JAVA_HOME=/home/ubuntu/java/jre
export GRINDER_HOME=/home/ubuntu/grinder-3.11
export CLASSPATH=$GRINDER_HOME/lib/grinder.jar:$CLASSPATH
export GRINDER_PROPERTIES=/home/ubuntu/testing/grinder.properties

java -classpath $CLASSPATH net.grinder.Grinder $GRINDER_PROPERTIES &>/home/ubuntu/testing/process.log
