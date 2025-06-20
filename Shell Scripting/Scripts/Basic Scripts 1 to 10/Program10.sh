#!/bin/bash

# This script takes number from user and calculates sum of digits

echo "Enter a number:"
read num

sum=0
temp=$num

while [ $temp -gt 0 ]
do
    digit=$((temp % 10))
    sum=$((sum + digit))
    temp=$((temp / 10))
done

echo "Sum of digits of $num is: $sum"
