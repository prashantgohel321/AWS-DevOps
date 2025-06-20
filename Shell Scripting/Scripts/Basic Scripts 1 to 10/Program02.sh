#!/bin/bash

# Take input from user, and add those 2 numbers

echo "Enter first number: "
read num1

echo "Enter second number: "
read num2

sum=$((num1 + num2))
echo "The sum of $num1 and $num2 is $sum"