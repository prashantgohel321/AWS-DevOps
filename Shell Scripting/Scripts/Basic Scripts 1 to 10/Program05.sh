#!/bin/bash

# This script takes one number from user, and then print multiplication table of that entered number.

echo "Enter a number: "
read num

echo "Multiplication table for $num"

for i in {1..10}
do
    result=$((num * i))
    echo "$num X $i = $result"
done