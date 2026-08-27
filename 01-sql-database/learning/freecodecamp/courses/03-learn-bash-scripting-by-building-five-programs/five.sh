#!/bin/bash

echo "~~ Five Programs ~~"
echo

echo "1. Questionnaire"
echo "2. Countdown"
echo "3. Bingo"
echo "4. Fortune"
echo "5. Exit"
echo

read -p "Choose a program: " CHOICE

case $CHOICE in
  1)
    bash questionnaire.sh
    ;;
  2)
    read -p "Start countdown from: " NUMBER
    bash countdown.sh "$NUMBER"
    ;;
  3)
    bash bingo.sh
    ;;
  4)
    bash fortune.sh
    ;;
  5)
    echo "Goodbye."
    ;;
  *)
    echo "Invalid option."
    ;;
esac