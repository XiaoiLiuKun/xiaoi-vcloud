#!/bin/bash
#sh config
#-DbotAccountFromProperties=1
ENV_VAR="-DC60DT=1"
APP_MAINCLASS=com.er.dbtool.DatabaseClearScript

ACTION=$1
APP_HOME=.
APP_PID=$APP_HOME/run.pid
APP_CONSOLE=$APP_HOME/logs/stdout.log

RUN_CMD=""

#java config
JAVA_HOME=/Library/Java/Home
CLASSPATH=$APP_HOME/classes/
for jarfile in `ls $APP_HOME/dependency/*.jar`;do
	CLASSPATH=$CLASSPATH:$jarfile;
done;

RUN_CMD="$JAVA_HOME/bin/java $ENV_VAR -cp $CLASSPATH -Xms256M -Xmx1024M -Xss256k -Xconcurrentio -XX:SurvivorRatio=5  -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=31 -XX:CMSInitiatingOccupancyFraction=90 -XX:+DisableExplicitGC -XX:MaxDirectMemorySize=256M -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:+UseConcMarkSweepGC -Dsun.net.inetaddr.ttl=60 -DuseSafeMode=false $APP_MAINCLASS"

nohup sh -c "exec $RUN_CMD >>$APP_CONSOLE 2>&1" >/dev/null &
