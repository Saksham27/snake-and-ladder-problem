#!/bin/bash -x

# constant
 
START_POSITION=0
NO_MOVE=0
SNAKE=1
LADDER=2
WIN_POSITION=100
INFINITE_LOOP=1

# varibales for player 1
diceRolled1=0
arrLength1=0
currPosition1=0

# variables for player 2
diceRolled2=0
arrLength2=0
currPosition2=0

# declare array to store all the positions after every dice roll
declare -a playerPosition1
declare -a playerPosition2

# function to roll the dice
function diceRoll() {
	echo $((RANDOM%6+1))
}

# fucntion to decide next move. No play , snake or ladder
# param1 : dice roll fucntion
# param2 : current position of player
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

# fucntion to get next position
function getPosition() {
	tempPosition=$( nextMove $( diceRoll ) $1 )
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

	echo $currPosition

}

# function of one move from player one
# param1 : current position of player 1
function playerOneMove() {
	currPosition1=$( getPosition $1 )
	playerPosition1[$arrLength1]=$currPosition1 # storing player position after evry die roll
	((arrLength1++))
}

# function of one move from player two
# param1 : current position of player 2
function playerTwoMove() {
	currPosition2=$( getPosition $1 )
	playerPosition2[$arrLength2]=$currPosition2 # storing player position after evry die roll
	((arrLength2++))
}

# starting the game
currPosition1=$START_POSITION # player 1
currPosition2=$START_POSITION # player 2

while [ $INFINITE_LOOP ]
do

	playerOneMove $currPosition1
	playerTwoMove $currPosition2

	if [ $currPosition1 -eq $WIN_POSITION ]
	then
		winner="player 1"
		break;
	fi
	if [ $currPosition2 -eq $WIN_POSITION ]
	then
		winner="player 2"
		break;
	fi

done
