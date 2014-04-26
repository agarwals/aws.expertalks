#!/bin/bash

export JAVA_HOME=/home/ubuntu/java/jre
export PATH=$PATH:$JAVA_HOME/bin
export GRINDER_HOME=/home/ubuntu/grinder-3.11
export CLASSPATH=$GRINDER_HOME/lib/grinder.jar:$CLASSPATH

java -classpath $CLASSPATH -Dgrinder.console.httpHost=grinderc net.grinder.Console -headless &>/home/ubuntu/testing/process.log
