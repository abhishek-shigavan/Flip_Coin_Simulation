#!/bin/bash -x

isHead=0
isTail=1

headCounter=0
tailCounter=0
gameCounter=0
winCounter=21

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
                echo "Its a Tie"
		break
        fi
done

if [ $headCounter -gt $tailCounter ]
then
        echo " Head is the Winner "
        echo " Winning Margin : $margin "
elif [ $tailCounter -gt $headCounter ]
then
        echo " Tail is the Winner "
        echo " Winning Margin : $margin "
fi



