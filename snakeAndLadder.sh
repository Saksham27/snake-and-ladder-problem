#!/bin/bash -x

# constant
 
START_POSITION=0
NO_MOVE=0
SNAKE=1
LADDER=2
WIN_POSITION=100
INFINITE_LOOP=1

# varibales
diceRolled=0
arrLength=0

# declare array to store all the positions after every dice roll
declare -a playerPosition

# function to roll the dice
function diceRoll() {
	echo $((RANDOM%6+1))
}

# fucntion to decide next move. No play , snake or ladder
function nextMove() {
	temp=$((RANDOM%3))
	if [ $temp -eq $NO_MOVE ]
	then
		echo $2
	fi

	if [ $temp -eq $SNAKE ] 
	then
		echo $(( $2-$1 ))
	fi

	if [ $temp -eq $LADDER ]
	then
		echo $(( $2+$1 ))
	fi
}

# starting the game
currPosition=$START_POSITION
while [ $INFINITE_LOOP ]
do 
	tempPosition=$( nextMove $( diceRoll ) $currPosition )
	(( diceRolled++ ))
	if [ $tempPosition -gt $WIN_POSITION ] # setting player position
	then
		currPosition=$currPosition
	else
		currPosition=$tempPosition
	fi

	if [ $currPosition -lt $START_POSITION ] # tackling situation where player gets snake move and gets negative position
	then
		currPosition=$START_POSITION
	fi

	playerPosition[$arrLength]=$currPosition # storing player position after evry die roll
	((arrLength++))

	if [ $currPosition -eq $WIN_POSITION ]
	then
		break;
	fi
done
