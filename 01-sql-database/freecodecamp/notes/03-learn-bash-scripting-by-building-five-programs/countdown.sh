#!/bin/bash

echo "~~ Countdown ~~"
echo

if [[ $1 =~ ^[0-9]+$ ]]
then
  for (( i=$1; i>=0; i-- ))
  do
    echo "$i"
    sleep 1
  done
else
  echo "Please provide a positive integer."
fi