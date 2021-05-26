#!/bin/bash -x

isHead=0
isTail=1

headCounter=0
tailCounter=0
winCounter=21

for((i=0; i<=41; i++))
do
        if [ $headCounter -eq $winCounter -o $tailCounter -eq $winCounter ]
        then
                break
        else
                coinSimulator=$(($RANDOM%2))

                if [ $coinSimulator -eq $isHead ]
                then
                        ((headCounter++))
                        headCounter=$headCounter
                else
                        ((tailCounter++))
                        tailCounter=$tailCounter
                fi

                margin=$(($headCounter - $tailCounter))
                margin=${margin#-}      #if answer is in negative removes negative sign
        fi
done

if [ $headCounter -eq $tailCounter ]
then
        echo " Tie "
elif [ $headCounter -gt $tailCounter ]
then
        echo " Head is the Winner "
        echo " Winning Margin : $margin "
else
        echo " Tail is the Winner "
        echo " Winning Margin : $margin "
fi


