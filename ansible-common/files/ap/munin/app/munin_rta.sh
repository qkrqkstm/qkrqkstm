#!/bin/sh
TODAY=`date +"%Y-%m-%d"`
TOMCAT_HOME1=/usr/local/tom_ca_coco
TOMCAT_HOME2=/usr/local/tom_ca_coco2

RTA1=0
RTA2=0

MONITOR_LOG1=$TOMCAT_HOME1/logs/monitorLog.log.$TODAY.log
MONITOR_LOG2=$TOMCAT_HOME2/logs/monitorLog.log.$TODAY.log

if [ -e $MONITOR_LOG1 ]; then
	RTA1=$(tail -n 10 $MONITOR_LOG1 | grep "SESSION\[" | tail -n 5 | awk -F "SESSION" '{print $2}' | tr -d "[]")
fi

if [ -e $MONITOR_LOG2 ]; then
	RTA2=$(tail -n 10 $MONITOR_LOG2 | grep "SESSION\[" | tail -n 5 | awk -F "SESSION" '{print $2}' | tr -d "[]")
fi


RTA1_CNT=$(echo "${RTA1}" | wc -l)
RTA2_CNT=$(echo "${RTA2}" | wc -l)

declare -i SUM1=0
for i1 in ${RTA1} ; do
   SUM1+=${i1} 
done
AVG1=$((${SUM1} / ${RTA1_CNT}))


declare -i SUM2=0
for i2 in ${RTA2} ; do
   SUM2+=${i2} 
done
AVG2=$((${SUM2} / ${RTA2_CNT}))


TOTAL=$(($AVG1 + $AVG2))
echo $TOTAL

