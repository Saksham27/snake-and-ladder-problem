#!/bin/bash -x

# constant 
START_POSITION=0

# function to roll the dice
function diceRoll() {
	echo $((RANDOM%6+1))
}

