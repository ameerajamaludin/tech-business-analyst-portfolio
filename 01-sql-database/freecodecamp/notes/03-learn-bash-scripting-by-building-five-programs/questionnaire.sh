#!/bin/bash

echo "~~ Questionnaire ~~"
echo

read -p "What's your name? " NAME
read -p "Where are you from? " LOCATION
read -p "What's your favorite programming language? " LANGUAGE

echo
echo "Hello $NAME from $LOCATION. I learned that your favorite programming language is $LANGUAGE."