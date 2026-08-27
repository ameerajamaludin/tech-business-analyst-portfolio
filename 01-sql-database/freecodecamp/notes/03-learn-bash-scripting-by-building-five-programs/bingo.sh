#!/bin/bash

echo "~~ Bingo Number Generator ~~"
echo

NUMBER=$(( RANDOM % 75 + 1 ))

if (( NUMBER <= 15 ))
then
  LETTER="B"
elif (( NUMBER <= 30 ))
then
  LETTER="I"
elif (( NUMBER <= 45 ))
then
  LETTER="N"
elif (( NUMBER <= 60 ))
then
  LETTER="G"
else
  LETTER="O"
fi

echo "The next number is: $LETTER$NUMBER"