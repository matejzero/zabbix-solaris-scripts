#!/bin/bash

COUNT=`iostat -x | awk '{print $1}' | tail +3 | wc -l`

#echo Quantity: $COUNT

echo "{"
echo -e "\t\"data\":[\n"

i=1
let COUNT=COUNT+1

while [ $i -lt $COUNT ]; do
        #echo Item: $i
		LOGDRIVE=`iostat -x | awk '{print $1}' | tail +3 | head -$i | tail -fn 1`
        let CHECK=COUNT-1
        if [ $i == $CHECK ]; then echo -e "\t { \"{#SDDISKNAME}\":\"$LOGDRIVE\" }"
        else echo -e "\t { \"{#SDDISKNAME}\":\"$LOGDRIVE\" },"
        fi
        let i=i+1
done

echo -e "\n\t]"
echo "}"

