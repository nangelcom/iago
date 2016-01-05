#!/bin/sh
#
# launch the parrot feeder

# JDWP_PORT=$1
# shift
# YJP_PORT=$1
# shift

#STANDARD_DEBUG_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=$JDWP_PORT"
#YOURKIT_DEBUG_OPTS="-agentpath:$APP_HOME/bin/linux-x86-64/libyjpagent.so=alloceach=1,port=$YJP_PORT,dir=$APP_HOME/Snapshots,logdir=$APP_HOME,onexit=memory"
#DEBUG_OPTS="$STANDARD_DEBUG_OPTS $YOURKIT_DEBUG_OPTS"

APP_NAME="feeder"
CONFIG="config/target/parrot-feeder.scala"
MAIN_CLASS="com.twitter.parrot.feeder.FeederMain"

HEAP_OPTS="-Xmx#{feederXmx}m -Xms#{feederXmx}m -XX:NewSize=512m"
GC_OPTS="-XX:+UseConcMarkSweepGC -verbosegc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -XX:+UseParNewGC -Xloggc:gc-feeder.log"

# see https://confluence.twitter.biz/display/RUNTIMESYSTEMS/Linux+Perf+Support

# PROFILE_OPTS='-agentlib:perfagent'

JAVA_OPTS="-server $GC_OPTS $HEAP_OPTS $PROFILE_OPTS $DEBUG_OPTS"

. scripts/common.sh "$@"
