#!/bin/bash

# This script takes one number from user and calculates a factorial.

echo "Enter number: "
read num

result=1

if [ $num -lt 0 ]; then
    echo "Factorial is not defined for negative numbers."
else
    for (( i=1; i<=num; i++ ))
    do
        result=$((result * i))
    done
    echo "Factorial $result."
fi