#!/bin/bash

COUNT=`iostat -nx | awk 'NR>2{print $11}' | wc -l`

#echo Quantity: $COUNT

echo "{"
echo -e "\t\"data\":[\n"

i=1
let COUNT=COUNT+1

while [ $i -lt $COUNT ]; do
        #echo Item: $i
        PHYDRIVE=`iostat -nx | awk 'NR>2{print $11}' | head -$i | tail -fn 1`
        let CHECK=COUNT-1
        if [ $i == $CHECK ]; then echo -e "\t { \"{#DISKNAME}\":\"$PHYDRIVE\" }"
        else echo -e "\t { \"{#DISKNAME}\":\"$PHYDRIVE\" },"
        fi
        let i=i+1
done

echo -e "\n\t]"
echo "}"

