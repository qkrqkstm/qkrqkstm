#!/bin/sh
TOMCAT_HOME1=/usr/local/tom_ca_coco/
TOMCAT_HOME2=/usr/local/tom_ca_coco2/

TOMCAT_OPEN_FILE_COUNT1=0
TOMCAT_OPEN_FILE_COUNT2=0

TOMCAT_PID1=$((`ps -ef | grep "java" | grep $TOMCAT_HOME1 | awk -F " " '{print $2}'`))
TOMCAT_PID2=$((`ps -ef | grep "java" | grep $TOMCAT_HOME2 | awk -F " " '{print $2}'`))

if [ ${TOMCAT_PID1} -gt 0 ]; then
	TOMCAT_OPEN_FILE_COUNT1=`lsof -p $TOMCAT_PID1 | wc -l`
	#TOMCAT_OPEN_FILE_COUNT1=`ls -l /proc/$TOMCAT_PID/fd | wc -l`
fi

if [ ${TOMCAT_PID2} -gt 0 ]; then
	TOMCAT_OPEN_FILE_COUNT2=`lsof -p $TOMCAT_PID2 | wc -l`
	#TOMCAT_OPEN_FILE_COUNT2=`ls -l /proc/$TOMCAT_PID2/fd | wc -l`
fi


TOTAL=$(($TOMCAT_OPEN_FILE_COUNT1 + $TOMCAT_OPEN_FILE_COUNT2))

echo $TOTAL
