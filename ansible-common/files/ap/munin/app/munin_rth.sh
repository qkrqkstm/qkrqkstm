#!/bin/sh
TOMCAT_HOME1=/usr/local/tom_ca_coco/
TOMCAT_HOME2=/usr/local/tom_ca_coco2/

TOMCAT_THREAD1=0
TOMCAT_THREAD2=0

TOMCAT_PID1=$((`ps -ef | grep "java" | grep $TOMCAT_HOME1 | awk -F " " '{print $2}'`))
TOMCAT_PID2=$((`ps -ef | grep "java" | grep $TOMCAT_HOME2 | awk -F " " '{print $2}'`))

if [ ${TOMCAT_PID1} -gt 0 ]; then
	TOMCAT_THREAD1=`ps -o nlwp $TOMCAT_PID1 | sed -n "2p"`
fi

if [ ${TOMCAT_PID2} -gt 0 ]; then
	TOMCAT_THREAD2=`ps -o nlwp $TOMCAT_PID2 | sed -n "2p"`
fi

TOTAL=$(($TOMCAT_THREAD1 + $TOMCAT_THREAD2))

echo $TOTAL
