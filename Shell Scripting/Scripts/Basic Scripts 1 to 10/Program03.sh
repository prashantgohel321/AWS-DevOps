#!/bin/bash

# This script takes one number from user and checks the number is even or odd, and then prints message accordingly.

echo "Enter number: "
read num

if (( num % 2 == 0 )); then
    echo "$num is even."
else
    echo "$num is odd."
fi