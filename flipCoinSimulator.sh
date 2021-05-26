#!/bin/bash -x

isHead=0
isTail=1
headCounter=0
tailCounter=0

for((i=0; i<=41; i++))
do
        coinSimulator=$(($RANDOM%2))

        if [ $coinSimulator -eq $isHead ]
        then
                ((headCounter++))
                headCounter=$headCounter
        else
                ((tailCounter++))
                tailCounter=$tailCounter
        fi
done

echo " Head Won : $headCounter times "
echo " Tail Won : $tailCounter times "

