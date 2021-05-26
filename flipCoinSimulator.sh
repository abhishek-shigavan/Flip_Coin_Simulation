#!/bin/bash -x

isHead=0
isTail=1

headCounter=0
tailCounter=0
gameCounter=0
winCounter=21

afterEqualMargin=2
equalCountPosition=0

for((i=0; i<=41; i++))
do
        ((gameCounter++))

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
                margin=${margin#-}

        if [ $gameCounter -eq 1 ]
        then
                continue
        elif [ $headCounter -eq $winCounter -o $tailCounter -eq $winCounter ]
        then
                break
        elif [ $headCounter -eq $tailCounter ]
        then
                equalCountPosition=$gameCounter
        elif [ $equalCountPosition -eq 0 ]
        then
                continue
        elif [ $gameCounter -gt $equalCountPosition -a $margin -eq $afterEqualMargin ]
        then
                break

        fi
done

if [ $headCounter -gt $tailCounter ]
then
        echo " Head is the Winner "
        echo " Winning Margin : $margin "
else
        echo " Tail is the Winner "
        echo " Winning Margin : $margin "
fi

