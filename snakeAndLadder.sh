#!/bin/bash -x

# constant
 
START_POSITION=0
NO_MOVE=0
SNAKE=1
LADDER=2

# function to roll the dice
function diceRoll() {
	echo $((RANDOM%6+1))
}

# fucntion to decide next move. No play , snake or ladder
function nextMove() {
	temp=$((RANDOM%3))
	if [ $temp -eq $NO_MOVE ]
	then
		echo $currPosition
	fi

	if [ $temp -eq $SNAKE ] 
	then
		echo $(( $currPosition-$1 ))
	fi

	if [ $temp -eq $LADDER ]
	then
		echo $(( $currPosition+$1 ))
	fi
}

# starting the game
currPosition=$START_POSITION
currPosition=$( nextMove $( diceRoll ) )
