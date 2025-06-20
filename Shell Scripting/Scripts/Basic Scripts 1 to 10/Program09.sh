#!/bin/bash

# This script takes one number from user and checks whether it is prime or not

echo "Enter number: "
read num

if [ "$num" -le 1 ]; then
    echo "$num is not a prime number."
    exit
fi

is_prime=1
for (( i=2; i<=num/2; i++ ))
do
    if (( num % i == 0 )); then
        is_prime=0
        break
    fi
done

if [ $is_prime -eq 1 ]; then
    echo "$num is a prime number."
else
    echo "$num is not a prime number."
fi