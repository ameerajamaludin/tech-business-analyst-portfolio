#!/bin/bash

echo "~~ Fortune Teller ~~"
echo

FORTUNES=(
  "You will learn something useful today."
  "A difficult problem will become easier with practice."
  "Your next project will teach you more than your last tutorial."
  "Consistency will take you further than motivation."
  "A small improvement today will pay off later."
)

INDEX=$(( RANDOM % ${#FORTUNES[@]} ))

echo "${FORTUNES[$INDEX]}"