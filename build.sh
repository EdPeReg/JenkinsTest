#!/usr/bin/env bash

echo "Compiling software"
gcc -Wall -Wextra -fsanitize=address -pedantic-errors main.c -o main
date

if [ $? -eq 0]; then
  echo "Compiling successfully"
else
  echo "Error compiling" >&2
  exit 1
fi
