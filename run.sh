#!/usr/bin/env bash

echo "Running the program"
date
./main

if [ $? -eq 0 ]; then
  echo "Program ran successfully"
else
  echo "Error at running program" >&2
  exit 1
fi
